import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const InternetConnectivityWrapper({
    super.key,
    required this.child,
  });

  @override
  State<InternetConnectivityWrapper> createState() =>
      _InternetConnectivityWrapperState();
}

class _InternetConnectivityWrapperState
    extends State<InternetConnectivityWrapper> {
  final InternetConnectionChecker _internetChecker =
      InternetConnectionChecker();
  late StreamSubscription<InternetConnectionStatus> _internetSubscription;
  bool _hasInternet = true;
  bool _showConnectionStatus = false;
  bool _previousConnectionState = true;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    // Get initial connection state
    _hasInternet = await _internetChecker.hasConnection;
    _previousConnectionState = _hasInternet;

    // If there's no initial connection, show the status immediately
    if (!_hasInternet) {
      setState(() {
        _showConnectionStatus = true;
      });
    }

    // Listen to connection changes
    _internetSubscription = _internetChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        final bool isConnected = status == InternetConnectionStatus.connected;

        // Only update if there's an actual change in connection state
        if (isConnected != _previousConnectionState) {
          if (mounted) {
            setState(() {
              _hasInternet = isConnected;
              _showConnectionStatus = true;
              _previousConnectionState = isConnected;
            });

            // Cancel existing timer if any
            _hideTimer?.cancel();

            // Start new timer only for restored connection
            if (isConnected) {
              _hideTimer = Timer(const Duration(seconds: 3), () {
                if (mounted) {
                  setState(() {
                    _showConnectionStatus = false;
                  });
                }
              });
            }
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _internetSubscription.cancel();
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _showConnectionStatus ? 32 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showConnectionStatus ? 1.0 : 0.0,
                child: Container(
                  width: double.infinity,
                  color: _hasInternet ? Colors.green : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    _hasInternet
                        ? tr("error.internet_restored")
                        : tr("error.no_internet"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}
