import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Ensures it's rounded
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width / 4;
    double padingSize = MediaQuery.of(context).size.width / 8;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('FAB Instead of Settings'),
        ),
        body: Center(
          child: Text(
            'Selected Index: $_selectedIndex',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: Icon(Icons.book_outlined),
          ),
        ),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home_outlined),
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _onItemTapped(0);
                },
              ),

              SizedBox(
                width: iconSize - padingSize,
              ),
              IconButton(
                icon: Icon(Icons.notifications_none_rounded),
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _onItemTapped(1);
                },
              ),
              // No SizedBox needed here as we're using custom positioning for FAB
              IconButton(
                icon: Icon(Icons.person_outline),
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _onItemTapped(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Calculate the center of the BottomAppBar
    final double bottomAppBarHeight =
        scaffoldGeometry.scaffoldSize.height - scaffoldGeometry.contentTop;

    final double screenWidth = scaffoldGeometry.scaffoldSize.width;
    final double fabX = (screenWidth / 2) - (screenWidth / 4);
    final double fabY = bottomAppBarHeight - scaffoldGeometry.contentTop / 2;
    return Offset(fabX, fabY);
  }
}
