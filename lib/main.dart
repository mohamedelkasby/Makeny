import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubit/cubit.dart';
import 'package:makeny/cubit/status.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:makeny/screens/entry_pages/splash_screen.dart';

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
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
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
              appBarTheme: AppBarTheme(backgroundColor: Colors.white),
              scaffoldBackgroundColor: const Color.fromARGB(
                  255, 255, 255, 255), // Set your preferred color here
              fontFamily: 'Cairo',
              // primarySwatch: mainColor,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: mainColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(50), // Ensures it's rounded
                ),
              ),
              bottomAppBarTheme: BottomAppBarTheme(
                /////the bottom navigation color
                surfaceTintColor: Colors.white,
                shadowColor: greyborderColor,
                // color: Colors.white,
                // shape: CircularNotchedRectangle(),
                ///////  the background shadow of the navigation bar
                elevation: 5,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
