import 'package:flutter/material.dart';
import 'dart:async';

import 'package:makeny/screens/entry_pages/defenition_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<bool> _isVisible = [false, false, false, false];
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
            Duration(seconds: 1),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DefenitionScreen(),
              ),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (_isVisible.every((element) => element == false)) {
              _startFadeSequence();
            }
            // else if (_isVisible.every((element) => element == true)) {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => DefenitionScreen(),
            //     ),
            //   );
            // }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 129),
                child: AnimatedOpacity(
                  opacity: _isVisible[0] ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Image.asset(
                    'assets/splash_images/image 56.png',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: _isVisible[1] ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/splash_images/image 57.png',
                    ),
                  ),
                  Image.asset(
                    'assets/splash_images/image 54.png',
                  ),
                  AnimatedOpacity(
                    opacity: _isVisible[2] ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/splash_images/image 55.png',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 129),
                child: AnimatedOpacity(
                  opacity: _isVisible[3] ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Image.asset(
                    'assets/splash_images/image 58.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
