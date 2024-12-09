import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/booking_screens/reservation_details.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingDateScreen extends StatefulWidget {
  const BookingDateScreen({
    super.key,
    required this.docSpecialize,
    required this.type,
  });

  final String docSpecialize;
  final String type;

  @override
  State<BookingDateScreen> createState() => _BookingDateScreenState();
}

class _BookingDateScreenState extends State<BookingDateScreen> {
  DateTime? selectedDate;
  DateTime focusedDate = DateTime.now();
  String? selectedTime;
  String? selectedReminder;

  final DateTime firstDay = DateTime.now();
  final DateTime lastDay = DateTime.now().add(const Duration(days: 365));

  String getMonthName(DateTime date) {
    if (context.locale.languageCode == "ar") {
      const arabicMonths = [
        "يناير",
        "فبراير",
        "مارس",
        "أبريل",
        "مايو",
        "يونيو",
        "يوليو",
        "أغسطس",
        "سبتمبر",
        "أكتوبر",
        "نوفمبر",
        "ديسمبر",
      ];
      return arabicMonths[date.month - 1];
    } else {
      return DateFormat('MMMM', 'en').format(date);
    }
  }

  void _goToPreviousMonth() {
    setState(() {
      // Calculate the previous month
      final previousMonth = DateTime(focusedDate.year, focusedDate.month - 1);
      if (previousMonth.isAfter(firstDay) ||
          isSameDay(previousMonth, firstDay)) {
        focusedDate = previousMonth;
      } else {
        // If the previous month exceeds the first available date, set it to the first available month
        focusedDate = firstDay;
      }
    });
  }

  void _goToNextMonth() {
    setState(() {
      // Calculate the next month
      final nextMonth = DateTime(focusedDate.year, focusedDate.month + 1);
      if (nextMonth.isBefore(lastDay) || isSameDay(nextMonth, lastDay)) {
        focusedDate = nextMonth;
      } else {
        // If the next month exceeds the last available date, set it to the last available month
        focusedDate = lastDay;
      }
    });
  }

  Widget circleSelectTime({
    required String time,
    required String desc,
    bool isSelected = false,
    Function()? ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: CircleAvatar(
        backgroundColor: isSelected
            ? mainColor400 // Selected color
            : const Color(0xffFAF5F4), // Default color
        minRadius: 30,
        maxRadius: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textDescription(
              text: time,
              textColor: isSelected
                  ? Colors.white
                  : Colors.black, // Text color changes too
            ),
            textDescription(
              text: desc,
              textColor: isSelected ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context,
            title: tr("available_appointments_online_consultation")),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: Container(
                          color: const Color(0xffFAF5F4),
                          child: Column(
                            children: [
                              TableCalendar(
                                firstDay: firstDay,
                                lastDay: lastDay,
                                focusedDay: focusedDate,
                                selectedDayPredicate: (day) {
                                  return isSameDay(
                                      selectedDate ?? focusedDate, day);
                                },
                                onDaySelected: (selectedDay, focusedDay) {
                                  setState(() {
                                    selectedDate =
                                        selectedDay; // Set selectedDate only on explicit day clicks
                                    focusedDate =
                                        focusedDay; // Update focusedDay
                                  });
                                },
                                calendarFormat: CalendarFormat.month,
                                daysOfWeekHeight: 22,
                                rowHeight: 45,
                                calendarStyle: CalendarStyle(
                                  tablePadding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  defaultTextStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  weekendTextStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  disabledTextStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[400],
                                  ),
                                  selectedTextStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  outsideDaysVisible: false,
                                  selectedDecoration: BoxDecoration(
                                    color: mainColor,
                                    shape: BoxShape.circle,
                                  ),
                                  todayDecoration: BoxDecoration(
                                    color: mainColor100,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                headerVisible: true,
                                headerStyle: HeaderStyle(
                                  titleCentered: false,
                                  leftChevronVisible: false,
                                  rightChevronVisible: false,
                                  titleTextFormatter: (date, locale) {
                                    String monthName = getMonthName(date);
                                    String englishYear =
                                        DateFormat('yyyy').format(date);
                                    return "$monthName  $englishYear";
                                  },
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  titleTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  headerMargin:
                                      const EdgeInsets.only(bottom: 15),
                                  headerPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  formatButtonVisible: false,
                                ),
                                locale: context.locale.languageCode == "ar"
                                    ? "ar"
                                    : "en",
                                calendarBuilders: CalendarBuilders(
                                  headerTitleBuilder: (context, date) {
                                    String monthName = getMonthName(date);
                                    String englishYear =
                                        DateFormat('yyyy').format(date);

                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "$monthName  ",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign
                                                    .right, // Ensure alignment is correct
                                              ),
                                              Text(
                                                "  $englishYear",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign
                                                    .right, // Ensure alignment is correct
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () => _goToPreviousMonth,
                                                child: const Icon(
                                                    Icons.chevron_left,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              GestureDetector(
                                                onTap: () => _goToNextMonth,
                                                child: const Icon(
                                                    Icons.chevron_right,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 8,
                                  color: const Color(0xffFAF5F4),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      selectedDate != null
                          // "Selected Date: ${selectedDate!.toLocal().toString().split(" ")[0]}",
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: textHeadLine(
                                    text: tr("set_the_time"),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    circleSelectTime(
                                      time: "3:00",
                                      desc: tr("evening"),
                                      isSelected: selectedTime == "3:00",
                                      ontap: () {
                                        setState(() {
                                          selectedTime = "3:00";
                                        });
                                      },
                                    ),
                                    circleSelectTime(
                                      time: "4:00",
                                      desc: tr("evening"),
                                      isSelected: selectedTime == "4:00",
                                      ontap: () {
                                        setState(() {
                                          selectedTime = "4:00";
                                        });
                                      },
                                    ),
                                    circleSelectTime(
                                      time: "5:00",
                                      desc: tr("evening"),
                                      isSelected: selectedTime == "5:00",
                                      ontap: () {
                                        setState(() {
                                          selectedTime = "5:00";
                                        });
                                      },
                                    ),
                                    circleSelectTime(
                                      time: "6:00",
                                      desc: tr("evening"),
                                      isSelected: selectedTime == "6:00",
                                      ontap: () {
                                        setState(() {
                                          selectedTime = "6:00";
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: textHeadLine(
                                    text: tr("remind_me_before"),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    circleSelectTime(
                                      time: "10",
                                      desc: tr("minutes"),
                                      isSelected: selectedReminder == "10",
                                      ontap: () {
                                        setState(() {
                                          selectedReminder = "10";
                                        });
                                      },
                                    ),
                                    circleSelectTime(
                                      time: "15",
                                      desc: tr("minute"),
                                      isSelected: selectedReminder == "15",
                                      ontap: () {
                                        setState(() {
                                          selectedReminder = "15";
                                        });
                                      },
                                    ),
                                    circleSelectTime(
                                      time: "30",
                                      desc: tr("minute"),
                                      isSelected: selectedReminder == "30",
                                      ontap: () {
                                        setState(() {
                                          selectedReminder = "30";
                                        });
                                      },
                                    ),
                                    circleSelectTime(
                                      time: "60",
                                      desc: tr("minute"),
                                      isSelected: selectedReminder == "60",
                                      ontap: () {
                                        setState(() {
                                          selectedReminder = "60";
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              defaultButton(
                text: tr("confirmation"),
                onTap: selectedTime != null
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InternetConnectivityWrapper(
                                child: ReservationDetails(
                                  date: selectedDate!
                                      .toLocal()
                                      .toString()
                                      .split(" ")[0],
                                  docSpecialize: widget.docSpecialize,
                                  type: widget.type,
                                  time: selectedTime!,
                                ),
                              ),
                            ));
                      }
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
