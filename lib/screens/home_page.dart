import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/models/grid_model.dart';
import 'package:makeny/models/medical_educate_model.dart';
import 'package:makeny/screens/medical_educate_desc_screeen%20.dart';
import 'package:makeny/widgets/custom_page_view.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
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
    List<String> pageViewTitles = [
      "أمراض القلب: الأسباب، الأعراض، والعلاج",
      "كيف تتجنب الأمراض القلبية؟ خطوات عملية",
      "الاختناق: أسباب متعددة وحلول ممكنة",
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            ////// appbar start ////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    textHeader(
                      text: "صباح الخير طلال",
                    ),
                    ///////// the sun icon . //////////
                    Image.asset("assets/icons/star.png"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset(
                    "assets/logo/main_logo.png",
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
              child: Stack(
                children: [
                  //////// the pageview start  /////////
                  PageView.builder(
                    /////////   the change of the current pageview that reflect with the dots location //////
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    controller: controller,
                    itemCount: pageViewTitles.length,
                    ///////////// the page view custom to desplay the locate of the backgound and with his related text ///////////
                    itemBuilder: (context, index) => customPageView(
                      text: pageViewTitles[index],
                      fromLeft: 100,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicalEducateDescScreen(
                            dataModel: medicalEducateList[index],
                          ),
                        ),
                      ),
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
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GridModelList[index].screen,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                      GridModelList[index].image,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    GridModelList[index].title,
                                    style: TextStyle(
                                      fontSize: 15,
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
