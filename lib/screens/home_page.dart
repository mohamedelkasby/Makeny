import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/widgets/custom_page_view.dart';
import 'package:makeny/widgets/doctor_container.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////// appbar start ////////
      appBar: AppBar(
        toolbarHeight: 70,
        ///////// the logo icon  /////////////
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/logo/Group 1321314641.png",
              fit: BoxFit.contain,
            ),
          )
        ],
        /////////// the greating message for the user with the sun icon/////////////
        leading: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "صباح الخير طلال",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            ///////// the sun icon . //////////
            Image.asset("assets/icons/star.png"),
          ],
        ),
        leadingWidth: double.infinity,
      ),
      ////// appbar end ////////

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
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
              child: Stack(
                children: [
                  //////// the pageview start  /////////
                  PageView(
                    /////////   the change of the current pageview that reflect with the dots location //////
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    controller: controller,
                    ///////////// the page view custom to desplay the locate of the backgound and with his related text ///////////
                    children: [
                      customPageView(
                          text: "أمراض القلب: الأسباب، الأعراض، والعلاج",
                          fromLeft: 100),
                      customPageView(
                          text: "كيف تتجنب الأمراض القلبية؟ خطوات عملية",
                          fromLeft: 20),
                      customPageView(
                          text: "الاختناق: أسباب متعددة وحلول ممكنة",
                          fromRight: 20),
                    ],
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
                                color: currentPage == index
                                    ? Colors.transparent
                                    : greyborderColor),
                            /////////   the shape of the current page in the pageview   ////////

                            shape: BoxShape.circle,
                            ////// change the color of the current page for certine colors and the others to white ////
                            color:
                                currentPage == index ? mainColor : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ////////////  the container that hold the pageView end /////////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الاطباء",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text("مشاهده الكل ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
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
                  Text(
                    "خدمات الكترونية",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text("مشاهده الكل ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
