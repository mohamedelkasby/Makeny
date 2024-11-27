import 'dart:async';
import 'package:flutter/material.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/screens/basic_screen.dart';
import 'package:makeny/screens/doctor_home_screen.dart';
import 'package:makeny/screens/entry_screens/defenition_screen.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_screens/login_screen.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

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
            () {
              if (AppCubit.get(context).isLoggedIn == "patient") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const InternetConnectivityWrapper(child: BasicScreen()),
                  ),
                );
              } else if (AppCubit.get(context).isLoggedIn == "doctor") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InternetConnectivityWrapper(
                        child: DoctorHomeScreen()),
                  ),
                );
              } else if (AppCubit.get(context).isFirstLogIn) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DefenitionScreen(),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const InternetConnectivityWrapper(child: LoginScreen()),
                  ),
                );
              }
            },
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
    // onTap: () {
    //   if (_isVisible.every((element) => element == false)) {
    //     _startFadeSequence();
    //   }
    // },

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Column(
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
      ),
    );
  }
}
