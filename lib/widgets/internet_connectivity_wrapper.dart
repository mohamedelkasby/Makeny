// internet_connectivity_wrapper.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const InternetConnectivityWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    checkInternet();

    _internetSubscription = _internetChecker.onStatusChange
        .listen((InternetConnectionStatus status) {
      setState(() {
        _hasInternet = status == InternetConnectionStatus.connected;
        _showConnectionStatus = true;
        if (_hasInternet) {
          Future.delayed(const Duration(seconds: 3), () {
            if (mounted) {
              setState(() {
                _showConnectionStatus = false;
              });
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _internetSubscription.cancel();
    super.dispose();
  }

  Future<bool> checkInternet() async {
    bool hasInternet = await _internetChecker.hasConnection;
    if (mounted) {
      setState(() {
        _hasInternet = hasInternet;
        _showConnectionStatus = !hasInternet;
      });
    }
    return hasInternet;
  }

  @override
  Widget build(BuildContext context) {
    // Wrap with Material widget to ensure proper context
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
                  child: SafeArea(
                    child: Text(
                      _hasInternet
                          ? 'تم استعادة الاتصال بالإنترنت'
                          : 'لا يوجد اتصال بالإنترنت',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
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
