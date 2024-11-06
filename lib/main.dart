import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:makeny/firebase_options.dart';
import 'package:makeny/screens/entry_pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // to set the status bar in the top color to white
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /////// change the color of statusbar and the icons in it ///////
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is InitilaThemeState) {
            AppCubit.get(context).loadLang();
          }
        },
        builder: (context, state) {
          return MaterialApp(
            ////         for language        ..................
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', ''), // Arabic, no country code
              Locale('en', ''), // english, no country code
            ],
            locale: Locale(AppCubit.get(context).lang, ''), // Force RTL layout

            theme: ThemeData(
              /// app bar color
              appBarTheme: const AppBarTheme(
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
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
