import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dialog Shadow Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _showCustomDialog(context),
            child: Text('Show Dialog'),
          ),
        ),
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    Navigator.of(context).push(_createDialogRoute());
  }

  Route _createDialogRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => _CustomDialog(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from the right
        const end = Offset(0.0, 0.0);
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class _CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.all(25), // the space around the dialog
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15), // the border radius of the dialog
      ),
      child: Material(
        elevation: 24.0, // Control the shadow depth here
        shadowColor: Colors.black
            .withOpacity(0.5), // Control the shadow color and transparency
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 30, 20, 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "هل تريد تسجيل الخروج؟",
                style: TextStyle(
                  fontSize: 21,
                  color: Color(0xff777777),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue, // Replace with your mainColor
                  ),
                  width: double.infinity,
                  height: 54,
                  child: MaterialButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                    child: Text(
                      "نعم, تسجيل الخروج",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "لا, البقاء",
                  style: TextStyle(
                    color: Color(0xffA2A2A2),
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
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

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}
