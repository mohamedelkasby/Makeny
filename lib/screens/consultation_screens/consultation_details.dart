import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/models/checkbox_test_model.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

class ConsultationDetails extends StatefulWidget {
  ConsultationDetails({
    super.key,
    required this.doctorModel,
    required this.date,
    required this.time,
    required this.status,
    required this.requiredTests,
    this.consultationId,
  });

  final DoctorModel doctorModel;
  final String date;
  final String time;
  final List<dynamic> requiredTests;
  final String? consultationId;
  String status;

  @override
  State<ConsultationDetails> createState() => _ConsultationDetailsState();
}

class _ConsultationDetailsState extends State<ConsultationDetails>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  bool isLoading = true;
  Map<String, dynamic>? data;
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getTheTest();
    _initializeData();
    _tabController = TabController(length: 2, vsync: this);
    _setupTabController();
  }

  void getTheTest() {
    for (int i = 0; i < widget.requiredTests.length; i++) {
      print(i);
      if (widget.requiredTests[i] == true) {
        patientTests.add(tests[i]);
      } else {
        continue;
      }
    }
  }

  void _setupTabController() {
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 1) {
          widget.status = tr("canceled");
        } else if (allTestsChecked()) {
          FireStoreService().updateStatusConsultationsData(
            consultationId: widget.consultationId!,
            userId: fireAuth.currentUser!.uid,
            status: tr("completed"),
          );
          widget.status = tr("completed");
        } else {
          widget.status = tr("opened");
        }
      });
    });
  }

  Future<void> _initializeData() async {
    try {
      await getfirebaseData(widget.doctorModel.email);
      if (allTestsChecked()) {
        widget.status = tr("completed");

        FireStoreService().updateStatusConsultationsData(
          consultationId: widget.consultationId!,
          userId: fireAuth.currentUser!.uid,
          status: tr("completed"),
        );
      }
    } catch (e) {
      print("Error loading data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<CheckboxTestModel> patientTests = [];

  bool allTestsChecked() {
    return patientTests.every((element) => element.isChecked == true);
  }

  Future<void> getfirebaseData(String email) async {
    try {
      DocumentSnapshot<Map<String, dynamic>>? snapshot =
          await FireStoreService().getUserDataByEmail(email)
              as DocumentSnapshot<Map<String, dynamic>>?;

      if (snapshot != null && snapshot.data() != null) {
        if (mounted) {
          setState(() {
            data = snapshot.data()!;
          });
        }
      } else {
        throw "Doctor data is empty in consultation_details page";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    List heartDisease = [
      tr("heart_disease.number_1"),
      tr("heart_disease.number_2"),
    ]; // change the name.
    return Scaffold(
      appBar: defaultAppbar(
        context,
        title: tr("consultation_details"),
        chatIcon: true,
        doctorfireData: data,
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
                      widget.doctorModel.drImage,
                    ),
                  ),
                ),
                Text(
                  widget.doctorModel.drName,
                  style: const TextStyle(
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
                      color: const Color(0xff44CC6A),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Text(
                        widget.doctorModel.drRole,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
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
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.date,
                          style: const TextStyle(
                            color: Color(0xff6C7380),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/clock.svg"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.time} ${tr("calculates.pm")}",
                          style: const TextStyle(
                            color: Color(0xff6C7380),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      SvgPicture.asset("assets/icons/cam-2.svg"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        tr("online"),
                        style: const TextStyle(
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
                            color: widget.status == tr("canceled")
                                ? mainColor
                                : const Color(0xff0EBE7F),
                          ),
                          child: const SizedBox(
                            width: 10,
                            height: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.status,
                          style: const TextStyle(
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
          ///////// here start the tabs
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      isScrollable: false,
                      labelStyle: TextStyle(
                        fontFamily: "cairo",
                        fontSize: 13,
                        color: mainColor,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                          text: tr("tasks"),
                        ),
                        Tab(
                          text: tr(
                              "makeny_rehabilitation_heart_failure_patients"),
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
                        controller: _tabController,
                        children: [
                          patientTests.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: ListView.builder(
                                    itemCount: patientTests.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 10,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            allTestsChecked();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    InternetConnectivityWrapper(
                                                  child: patientTests[index]
                                                      .testPage,
                                                ),
                                              ),
                                            ).then((value) {
                                              if (value == true) {
                                                setState(() {
                                                  patientTests[index]
                                                      .isChecked = true;
                                                });
                                              }
                                              if (allTestsChecked()) {
                                                widget.status = tr("completed");

                                                FireStoreService()
                                                    .updateStatusConsultationsData(
                                                  consultationId:
                                                      widget.consultationId!,
                                                  userId:
                                                      fireAuth.currentUser!.uid,
                                                  status: tr("completed"),
                                                );
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffEBEBEB),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 20,
                                                horizontal: 15,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: textNormal(
                                                      text: patientTests[index]
                                                          .testName,
                                                      textColor: const Color(
                                                          0xff6A6A6A),
                                                      wrap: true,
                                                    ),
                                                  ),
                                                  SvgPicture.asset(
                                                    patientTests[index]
                                                            .isChecked
                                                        ? "assets/icons/checked_box.svg"
                                                        : "assets/icons/unchecked_box.svg",
                                                    width: 20,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Center(child: textNormal(text: "no tasks yet")),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            child: ListView.builder(
                              itemCount: heartDisease.length,
                              itemBuilder: (context, index) => Text(
                                "${index + 1} - ${heartDisease[index]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
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
