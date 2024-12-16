import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/chat_pages/chat_screen.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/delete_dialog.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/transition_between_pages.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({
    super.key,
    required this.pathientData,
    required this.consultationId,
  });
  final Map<String, dynamic> pathientData;
  final String consultationId;

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

final List<String> items = [
  tr("doctor_page.tests.active"),
  tr("doctor_page.tests.quality_of_life"),
  tr("doctor_page.tests.performance_upper_limbs"),
  tr("doctor_page.tests.performance_lower_limbs"),
];

// Track the state of each checkbox
List<bool> checked = [];

// void getTextResult(userId) {

class _ControlScreenState extends State<ControlScreen> {
  @override
  void initState() {
    checked = List<bool>.filled(items.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: Colors.white,
          ),
          title: Text(
            tr("doctor_page.control_page"),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InternetConnectivityWrapper(
                            child: ChatScreen(
                              receiverData: widget.pathientData,
                            ),
                          ),
                        ),
                      );
                    },
                    child: textHeader(
                      text: tr("doctor_page.chat"),
                      textColor: mainColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      transitionBetweenPages(
                        context,
                        thePage: deletDialog(
                          context,
                          userId: widget.pathientData["uid"],
                          consultationId: widget.consultationId,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.close,
                      color: mainColor,
                      size: 25,
                    ),
                  )
                ],
              ),
              Divider(
                color: mainColor200,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Center(
                          child: textHeaderLight(
                            text: tr("doctor_page.required_tests"),
                            textColor: mainColor400,
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(
                          items.length,
                          (index) {
                            return CheckboxListTile(
                              title: Text(items[index]),
                              value: checked[index],
                              activeColor: mainColor200,
                              onChanged: (bool? value) {
                                setState(() {
                                  checked[index] = value ?? false;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      Center(
                        child: defaultButton(
                          text: tr("doctor_page.send_the_tests"),
                          onTap: () {
                            FireStoreService().updateTestsConsultationsData(
                              userId: widget.pathientData["uid"],
                              consultationId: widget.consultationId,
                              requiredTests: checked,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  tr("doctor_page.tests_are_sent"),
                                ),
                                backgroundColor: mainColor300,
                                duration: const Duration(
                                  seconds: 4,
                                ),
                              ),
                            );
                          },
                          // width: MediaQuery.sizeOf(context).width * .55,
                        ),
                      ),
                      Divider(
                        color: mainColor200,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Center(
                          child: textHeaderLight(
                            text: tr("doctor_page.done_tests"),
                            textColor: mainColor400,
                          ),
                        ),
                      ),
                      StreamBuilder(
                        stream: FireStoreService()
                            .getTestsData(userID: widget.pathientData["uid"]),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                                child: Text("Error: ${snapshot.error}"));
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  textDescription(text: tr("there_is_no")),
                                  textDescription(
                                      text: " ${tr("answered")} ",
                                      textColor: mainColor),
                                  textDescription(text: tr("tests_1")),
                                ],
                              ),
                            );
                          } else {
                            // Track the expanded state of each document
                            final expandedStates = List<bool>.filled(
                              snapshot.data!.docs.length,
                              false,
                            );
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: snapshot.data!.docs
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final index = entry.key;
                                final doc = entry.value;
                                final data = doc.data() as Map<String, dynamic>;

                                // Check if the key is 'testTime' and extract the date and time
                                String testTimeStr = '';
                                if (data.containsKey('testTime')) {
                                  var testTime = data['testTime'];
                                  if (testTime is Timestamp) {
                                    // Convert Timestamp to DateTime
                                    DateTime dateTime = testTime.toDate();
                                    // Format the DateTime as needed
                                    testTimeStr =
                                        "${dateTime.day}-${dateTime.month}-${dateTime.year}   ${dateTime.hour}:${dateTime.minute}";
                                  }
                                }

                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return Card(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title: textHeadLine(
                                              text: doc.id,
                                              wight: FontWeight.w600,
                                              size: 17,
                                            ), // Document ID
                                            trailing: IconButton(
                                              icon: Icon(
                                                expandedStates[index]
                                                    ? Icons.expand_less
                                                    : Icons.expand_more,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  expandedStates[index] =
                                                      !expandedStates[index];
                                                });
                                              },
                                            ),
                                          ),
                                          if (expandedStates[index])
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                                vertical: 8.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Display the formatted test time if it exists
                                                  if (testTimeStr.isNotEmpty)
                                                    Text(
                                                      "Test Time: $testTimeStr",
                                                      style: const TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  // Display other document fields
                                                  ...data.entries
                                                      .where((entry) =>
                                                          entry.key !=
                                                          'testTime')
                                                      .map((entry) {
                                                    return Text(
                                                      "${entry.key}: ${entry.value}",
                                                      style: const TextStyle(
                                                          fontSize: 16.5),
                                                    );
                                                  }),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
