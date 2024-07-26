import 'package:flutter/material.dart';
import 'package:makeny/screens/entry_pages/defenition_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        // backgroundColor: mainColor,
        body: SafeArea(
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DefenitionScreen(),
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // textBaseline: TextBaseline.ideographic,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 129),
                  child: Image.asset(
                    'assets/splash_images/image 56.png',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/splash_images/image 57.png',
                    ),
                    Image.asset(
                      'assets/splash_images/image 54.png',
                    ),
                    Image.asset(
                      'assets/splash_images/image 55.png',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 129),
                  child: Image.asset(
                    'assets/splash_images/image 58.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
