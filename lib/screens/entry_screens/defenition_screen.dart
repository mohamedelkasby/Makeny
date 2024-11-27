import 'package:flutter/material.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_screens/login_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/page_view_def.dart';

class DefenitionScreen extends StatefulWidget {
  const DefenitionScreen({super.key});

  @override
  State<DefenitionScreen> createState() => _DefenitionScreenState();
}

class _DefenitionScreenState extends State<DefenitionScreen> {
  final PageController pageControl = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // to show only the bottom bar and make the top status disapear

    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.111,
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/logo/logo.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  InkWell(
                    onTap: () {
                      AppCubit.get(context).saveFirstTime();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const InternetConnectivityWrapper(
                                  child: LoginScreen()),
                        ),
                      );
                    },
                    child: const Text(
                      "تخطي ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )),

          ///the start of pageview <=====
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              controller: pageControl,
              children: [
                defaultPageView(
                  context,
                  image: "assets/definition/Group 1000003172.png",
                  text: "استشارات طبيه موثوقه من راحه منزلك",
                ),
                defaultPageView(
                  context,
                  image: "assets/definition/OBJECT.png",
                  text: "افضل الاختبارات الطبية المعتمدة",
                ),
                defaultPageView(
                  context,
                  image: "assets/definition/Group.png",
                  text:
                      "تحليل النتائج وتحديد نسبة الخطورة للإصابة بأمراض القلب و مضاعفاتها",
                ),
              ],
            ),
          ),

          ///the End of pageview <=====
          //////////////// buttons /////////////////////
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /////////// replace it with the elevatedButton when the internet is connected
                squareButton(
                    onTap: () {
                      setState(() {
                        currentPage == 0
                            ? currentPage = 0
                            : pageControl.previousPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.ease);
                      });
                    },
                    color: currentPage == 0
                        ? Colors.white.withOpacity(.6)
                        : Colors.white,
                    widget: Icon(
                      Icons.chevron_left,
                      color: mainColor,
                    )),
                const SizedBox(width: 10),
                squareButton(
                    onTap: () {
                      setState(() {
                        currentPage == 2
                            ? Future.delayed(const Duration(milliseconds: 500),
                                () {
                                AppCubit.get(context).saveFirstTime();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    //TODO: put the internet checker here
                                    builder: (context) =>
                                        const InternetConnectivityWrapper(
                                      child: const LoginScreen(),
                                    ),
                                  ),
                                );
                              })
                            : pageControl.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.ease);
                      });
                    },
                    widget: Icon(
                      Icons.chevron_right,
                      color: mainColor,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // Total number of pages
                (index) => Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      color: currentPage == index ? Colors.white : mainColor200,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
