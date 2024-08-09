import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/consultation_model.dart';
import 'package:makeny/models/test_Checkboxe_modle.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class ConsultationDetails extends StatefulWidget {
  const ConsultationDetails({
    super.key,
    required this.datamodel,
  });

  final ConsultationModel datamodel;

  @override
  State<ConsultationDetails> createState() => _ConsultationDetailsState();
}

class _ConsultationDetailsState extends State<ConsultationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(
        context,
        title: "تفاصيل الاستشارة ",
        goChat: true,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CircleAvatar(
                    radius: 60,
                    foregroundImage: AssetImage(
                      widget.datamodel.doctorImg,
                    ),
                  ),
                ),
                Text(
                  widget.datamodel.doctorName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(
                      0xff6C7380,
                    ),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff44CC6A),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Text(
                        widget.datamodel.specialization,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/deta.svg"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.datamodel.date,
                          style: TextStyle(
                            color: Color(0xff6C7380),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/clock.svg"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.datamodel.time,
                          style: TextStyle(
                            color: Color(0xff6C7380),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      SvgPicture.asset("assets/icons/cam-2.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "اون لاين",
                        style: TextStyle(
                          color: Color(0xff6C7380),
                          fontSize: 16,
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff0EBE7F),
                          ),
                          child: SizedBox(
                            width: 10,
                            height: 10,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "مفتوحه",
                          style: TextStyle(
                            color: Color(0xff6C7380),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: false,
                      labelStyle: TextStyle(
                        fontFamily: "cairo",
                        fontSize: 13,
                        color: mainColor,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                          text: 'المهام ',
                        ),
                        Tab(
                          text: 'مكني لتأهيل مرضى قصور القلب',
                        ),
                      ],
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: mainColor, width: 2),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.builder(
                            itemCount: test.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffEBEBEB),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: CheckboxListTile(
                                    checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    side: BorderSide(
                                        width: 1.0, color: mainColor200),
                                    activeColor: mainColor,
                                    title: Text(
                                      test[index].nameTest,
                                      style: TextStyle(
                                        color: Color.fromARGB(196, 51, 51, 51),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    value: test[index].checkedOrNot,
                                    onChanged: (bool? value) {
                                      setState(
                                        () {
                                          test[index].checkedOrNot = value!;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    test[index].namePage,
                                              ));
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "1 - ممارسة الرياضة ٥ مرات/الأسبوع",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "2 - رياضة المقاومة مرتين/الأسبوع",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
