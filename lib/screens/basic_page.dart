import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/home_page.dart';
import 'package:makeny/screens/notification_screen.dart';
import 'package:makeny/screens/user_pages/account_page.dart';

class BasicPage extends StatefulWidget {
  BasicPage({super.key});

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pagesList = [HomePage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width / 4;
    double padingSize = MediaQuery.of(context).size.width / 8;

    return SafeArea(
      child: Scaffold(
        ////////        body      //////////

        body: pagesList[selectedIndex],

        /////////////   floation action button Start ///////////
        floatingActionButton: SizedBox(
          width: 85,
          height: 85,
          child: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: Icon(Icons.book_outlined),
          ),
        ),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(),
        /////////////   floation action button end //////////

        /////////////   bottom navigation bar  start //////////
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(150),
                onTap: () {
                  onItemTapped(0);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: selectedIndex == 0 ? mainColor : Colors.grey,
                    ),
                    Text(
                      "الرئيسيه",
                      style: TextStyle(
                        color: selectedIndex == 0 ? mainColor : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                width: iconSize - padingSize,
              ),
              //////// this icon will not be selected when click on it
              InkWell(
                borderRadius: BorderRadius.circular(150),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.grey,
                    ),
                    Text(
                      "الاشعارات",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ), /////////

              // No SizedBox needed here as we're using custom positioning for FAB
              InkWell(
                borderRadius: BorderRadius.circular(150),
                onTap: () {
                  onItemTapped(1);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: selectedIndex == 1 ? mainColor : Colors.grey,
                    ),
                    Text(
                      "الرئيسيه",
                      style: TextStyle(
                        color: selectedIndex == 1 ? mainColor : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              // ظظظظظظظ
            ],
          ),
        ),

        /////////////   bottom navigation bar  end //////////
      ),
    );
  }
}
/////////////   custom locate the floating action button  //////////

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
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
    // -(screenWidth / 4);

    final double fabY = scaffoldGeometry.contentBottom - fabHeight * (2 / 3);

    return Offset(fabX, fabY);
  }
}
