import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeny/screens/entry_pages/defenition_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<bool> _isVisible = [false, false, false, false, false];
  int _currentImageIndex = 0;
  Timer? _timer;

  void _startFadeSequence() {
    _timer = Timer.periodic(const Duration(milliseconds: 1200), (timer) {
      setState(() {
        _isVisible[_currentImageIndex] = true;
        _currentImageIndex++;
        if (_currentImageIndex >= _isVisible.length) {
          _timer?.cancel();
          Future.delayed(
            const Duration(seconds: 1),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DefenitionScreen(),
              ),
            ),
          );
        }
      });
    });
  }

  @override
  void initState() {
    _startFadeSequence();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      // SystemUiOverlay.top,
      // SystemUiOverlay.bottom,
    ]);

    // onTap: () {
    //   if (_isVisible.every((element) => element == false)) {
    //     _startFadeSequence();
    //   }
    // },

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 129),
              child: AnimatedOpacity(
                opacity: _isVisible[1] ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/splash_images/image 56.png',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _isVisible[2] ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(
                    'assets/splash_images/image 57.png',
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible[0] ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    'assets/splash_images/image 54.png',
                    width: 75,
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible[3] ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(
                    'assets/splash_images/image 55.png',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 129),
              child: AnimatedOpacity(
                opacity: _isVisible[4] ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/splash_images/image 58.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
