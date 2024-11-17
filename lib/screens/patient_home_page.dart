import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/models/grid_model.dart';
import 'package:makeny/models/medical_educate_model.dart';
import 'package:makeny/models/user_model.dart';
import 'package:makeny/screens/medical_education_screens/medical_educate_desc_screeen%20.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/doctor_container.dart';

class PatientHomePage extends StatefulWidget {
  PatientHomePage({super.key});

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation;
  // late Animation<double> _fadeAnimation;
  int _currentPage = 0;
  final List<double> stopPositions = [-0.5, 0.0, 0.5];

  final List<String> pageViewTitles = [
    "أمراض القلب: الأسباب، الأعراض، والعلاج",
    "كيف تتجنب الأمراض القلبية؟ خطوات عملية",
    "الاختناق: أسباب متعددة وحلول ممكنة",
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 10), // 3 seconds per stop
      vsync: this,
    );

    _backgroundAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: CustomCurve(stopPositions),
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
    // show the top status and bottom controllers
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom
    ]); // Show status bar

    // List<String> nameParts = AppCubit.get(context).userName.split(' ');
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            ////// appbar start ////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      textHeader(
                        text: "صباح الخير   ",
                      ),
                      Expanded(
                        child: FutureBuilder<UserModel>(
                            future: FireStoreService()
                                .getUserDetails(userID: auth.currentUser!.uid),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                UserModel? data = snapshot.data;
                                return textHeader(
                                  text: data!.name ?? "",
                                  wrap: true,
                                );
                              }
                              if (snapshot.hasError) {
                                return textHeader(text: " ");
                              }
                              return CircularProgressIndicator();
                            }),
                      ),
                      ///////// the sun icon . //////////
                      Image.asset("assets/icons/star.png"),
                      // const Expanded(
                      //   child: SizedBox(),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset(
                    "assets/logo/main_logo_shadow.png",
                    width: 40,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
            ////// appbar end ////////

            ////////////    the container that hold the pageView start /////////
            Container(
              margin: EdgeInsets.only(bottom: 10),
              /////// the radius of the pageview  ///////
              decoration: BoxDecoration(
                border: Border.all(
                  color: greyborderColor,
                ),
                borderRadius: BorderRadius.circular(15),
                // color: Colors.amber,
              ),
              height: 170,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicalEducateDescScreen(
                      dataModel: medicalEducateList[_currentPage],
                    ),
                  ),
                ),
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
                      child: Text(
                        pageViewTitles[_currentPage],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                    ),

                    ///////////////   the page view ends ////////////
                    ////////// the location of the dots thate related with the parent container   /////////
                    Positioned(
                      bottom: 8,
                      left: (MediaQuery.of(context).size.width * .5) - 30 - 6,
                      child: Row(
                        children: List.generate(
                          3, // Total number of pages
                          (index) => Container(
                            width: 10,
                            height: 10,
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: _currentPage == index
                                      ? Colors.transparent
                                      : greyborderColor),
                              /////////   the shape of the current page in the pageview   ////////

                              shape: BoxShape.circle,
                              ////// change the color of the current page for certine colors and the others to white ////
                              color: _currentPage == index
                                  ? mainColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ////////////  the container that hold the pageView end /////////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textHeadLine(
                    text: "الاطباء",
                  ),
                  textHeadLine(
                    text: "مشاهده الكل ",
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //// container that hold the image with his role and the name of the doctor /////
                doctorContainer(context,
                    doctorsData: dr1, textBackColor: mainColor),
                doctorContainer(
                  context,
                  doctorsData: dr2,
                  textBackColor: Color(0xff0F7BDD),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textHeadLine(
                    text: "خدمات الكترونية",
                  ),
                  textHeadLine(
                    text: "مشاهده الكل ",
                  )
                ],
              ),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3, // 3 columns
              children: List.generate(
                8,
                (index) {
                  return Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xffE8E8E8),
                        width: 1.5,
                      ),
                    ),
                    margin: EdgeInsets.all(4),
                    child: Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Opacity(
                              opacity: .1,
                              child: Image.asset(
                                "assets/designs/hex_design.png",
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 6, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    GridModelList[index].screen,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    GridModelList[index].image,
                                    height:
                                        MediaQuery.sizeOf(context).height * .06,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                  ),
                                  child: Text(
                                    GridModelList[index].title,
                                    style: TextStyle(
                                      fontSize: GridModelList[index].title ==
                                              "المساعد الذكي"
                                          ? 14
                                          : 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////

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
