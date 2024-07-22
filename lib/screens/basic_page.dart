import 'package:flutter/material.dart';
import 'package:makeny/cubit/cubit.dart';
import 'package:makeny/screens/home_page.dart';
import 'package:makeny/screens/notification_screen.dart';
import 'package:makeny/screens/user_pages/account_page.dart';
import 'package:makeny/widgets/icon_with_label.dart';

class BasicPage extends StatelessWidget {
  BasicPage({
    super.key,
  });

  final List<Widget> pagesList = [
    HomePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width / 4;
    final double padingSize = MediaQuery.of(context).size.width / 8;

    return SafeArea(
      child: Scaffold(
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
              icon: Icons.book_outlined,
              label: "احجز موعد",
              color: Colors.white,
              onTap: () {},
            ),
          ),
        ),
        floatingActionButtonLocation: _CustomFloatingActionButtonLocation(),
        /////////////   floation action button end //////////

        /////////////   bottom navigation bar  start //////////
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              iconWithLabel(
                context,
                icon: Icons.home_outlined,
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
                icon: Icons.notifications_none_rounded,
                label: "الاشعارات",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                ),
              ),
              iconWithLabel(
                context,
                icon: Icons.person_outline,
                label: "الحساب",
                indexNumber: 1,
                onTap: () => AppCubit.get(context).onItemTapped(1),
              ),
            ],
          ),
        ),

        /////////////   bottom navigation bar  end //////////
      ),
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
