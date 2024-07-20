import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeny/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /////// change the color of statusbar and the icons in it ///////
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.light, // status bar icon color
      ),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        ////         for language        ..................
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', ''), // Arabic, no country code
          Locale('en', ''), // english, no country code
        ],
        locale: Locale("ar", ''), // Force RTL layout
        theme: ThemeData(
          fontFamily: 'Cairo',
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
