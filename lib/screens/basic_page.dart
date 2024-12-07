import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/screens/patient_home_page.dart';
import 'package:makeny/screens/notification_screen.dart';
import 'package:makeny/screens/user_pages/account_page.dart';
import 'package:makeny/widgets/icon_with_label.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/transition_between_pages.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({
    super.key,
  });

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  final List<Widget> pagesList = [
    PatientHomePage(),
    const AccountPage(),
  ];
  @override
  void initState() {
    AppCubit.get(context).saveLooged("patient");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width / 4;
    final double padingSize = MediaQuery.of(context).size.width / 8;

    FirebaseAuth auth = FirebaseAuth.instance;

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        // show the top status and bottom controllers
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [
          SystemUiOverlay.top,
          SystemUiOverlay.bottom
        ]); // Show status bar
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,

          ////////        body      //////////

          body: pagesList[AppCubit.get(context).selectedBNBIndex],

          /////////////   floation action button Start ///////////
          floatingActionButton: SizedBox(
            width: 85,
            height: 85,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: iconWithLabel(
                context,
                svgIcon: "assets/icons/reserve.svg",
                label: "احجز موعد",
                color: Colors.white,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InternetConnectivityWrapper(
                      child: DangerMeasureScreen(
                        appbar: "مقياس الخطورة",
                        // yesOrNoQuestions: ["هل تدخن؟"],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: _CustomFloatingActionButtonLocation(),
          /////////////   floation action button end //////////

          /////////////   bottom navigation bar  start //////////
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                iconWithLabel(
                  context,
                  svgIcon: "assets/icons/home.svg",
                  label: "الرئيسيه",
                  indexNumber: 0,
                  onTap: () => AppCubit.get(context).onItemTapped(0),
                ),
                //////// this icon will not be selected when click on it
                SizedBox(
                  width: iconSize - padingSize,
                ),
                iconWithLabel(
                  context,
                  svgIcon: "assets/icons/notification.svg",
                  label: "الاشعارات",
                  onTap: () {
                    transitionBetweenPages(
                      context,
                      direction: Direction.fromBottom,
                      thePage: const NotificationScreen(),
                      forwardCurve: Curves.easeInOut,
                    );
                  },
                ),
                iconWithLabel(
                  context,
                  svgIcon: "assets/icons/user.svg",
                  label: "الحساب",
                  indexNumber: 1,
                  onTap: () {
                    AppCubit.get(context).loadImage(key: auth.currentUser!.uid);

                    AppCubit.get(context).onItemTapped(1);
                  },
                ),
              ],
            ),
          ),

          /////////////   bottom navigation bar  end //////////
        );
      },
    );
  }
}

/////////////   custom locate the floating action button  //////////

class _CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Calculate the center of the BottomAppBar
    final textDirection = scaffoldGeometry.textDirection;
    final double screenWidth = scaffoldGeometry.scaffoldSize.width;

    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double fabWidth = scaffoldGeometry.floatingActionButtonSize.width;

// Adjust the X position to be next to the third icon based on directionality
    final double fabX = textDirection == TextDirection.ltr
        ? (screenWidth / 2) - (fabWidth / 2) - (fabWidth * 3 / 4)
        : (screenWidth / 2) - (fabWidth / 2) + (fabWidth * 3 / 4);

    final double fabY = scaffoldGeometry.contentBottom - fabHeight * (2 / 3);

    return Offset(fabX, fabY);
  }
}
