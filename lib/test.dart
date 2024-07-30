import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

void main(List<String> args) {
  runApp(
    Test(),
  );
}

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation;
  late Animation<double> _fadeAnimation;
  int _currentPage = 0;

  final List<String> pageViewTitles = [
    "أمراض القلب: الأسباب، الأعراض، والعلاج",
    "كيف تتجنب الأمراض القلبية؟ خطوات عملية",
    "الاختناق: أسباب متعددة وحلول ممكنة",
  ];
  final List<double> stopPositions = [-0.5, 0.0, 0.5];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 9), // 3 seconds per stop
      vsync: this,
    );

    _backgroundAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: CustomCurve(stopPositions),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.1, curve: Curves.easeInOut),
      ),
    );

    _animationController.repeat();
    _animationController.addListener(_onAnimationChanged);
  }

  void _onAnimationChanged() {
    final progress = _animationController.value;
    if (progress < 1 / 3) {
      _currentPage = 0;
    } else if (progress < 2 / 3) {
      _currentPage = 1;
    } else {
      _currentPage = 2;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _animationController.removeListener(_onAnimationChanged);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: greyborderColor,
                  ),
                ),
                height: 170,
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _backgroundAnimation,
                      builder: (context, child) {
                        return Positioned(
                          bottom: 50,
                          left: MediaQuery.of(context).size.width / 2 +
                              (_backgroundAnimation.value * 1.4 - 0.7) * 100 -
                              110, // Adjust 110 based on your image size
                          child: Image.asset(
                            "assets/designs/Vector.png",
                            width: 220,
                            height: 170,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),

                    Center(
                      child: AnimatedBuilder(
                        animation: _fadeAnimation,
                        builder: (context, child) {
                          return Text(
                            pageViewTitles[_currentPage],
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),
                    ///////////////   the page view ends ////////////
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCurve extends Curve {
  final List<double> stopPositions;

  CustomCurve(this.stopPositions);

  @override
  double transform(double t) {
    int index = (t * 3).floor();
    double localT = (t * 3) % 1;

    double start = stopPositions[index];
    double end = stopPositions[(index + 1) % 3];

    // Use a smoother easing function
    double eased = _smoothStep(localT);

    return _normalizeValue(start + (end - start) * eased);
  }

  double _smoothStep(double t) {
    // Improved smooth step function
    return t * t * (3 - 2 * t);
  }

  double _normalizeValue(double value) {
    // Normalize the value to be between 0 and 1
    return (value + 0.5) / 1.0;
  }
}
