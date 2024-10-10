import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
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
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Color(0xffFBFBFB), // status bar color
              statusBarIconBrightness: Brightness.dark, // status bar icon color ي==== 
            ),
          );
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
            locale: Locale(AppCubit.get(context).lang, ''), // Force RTL layout

            theme: ThemeData(
              /// app bar color
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
              ),
              // the scaffold floor color
              scaffoldBackgroundColor: Colors.white,
              // the font style
              fontFamily: 'Cairo',
              primarySwatch: Colors.deepOrange,

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
