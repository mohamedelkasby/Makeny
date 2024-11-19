import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/booking_pages/reservation_details.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingDateScreen extends StatefulWidget {
  const BookingDateScreen({
    super.key,
    required this.docSpecialize,
  });

  final String docSpecialize;

  @override
  State<BookingDateScreen> createState() => _BookingDateScreenState();
}

class _BookingDateScreenState extends State<BookingDateScreen> {
  DateTime? selectedDate;
  DateTime focusedDate = DateTime.now();

  final DateTime firstDay = DateTime.now();
  final DateTime lastDay = DateTime.now().add(const Duration(days: 365));

  String getMonthInArabic(DateTime date) {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            defaultAppbar(context, title: "المواعيد المتاحة - استشارة اونلاين"),
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
                                    String arabicMonth = getMonthInArabic(date);
                                    String englishYear =
                                        DateFormat('yyyy').format(date);
                                    return "$arabicMonth  $englishYear";
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
                                locale: "ar",
                                calendarBuilders: CalendarBuilders(
                                  headerTitleBuilder: (context, date) {
                                    String arabicMonth = getMonthInArabic(date);
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
                                                "$arabicMonth  ",
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
                                              SizedBox(
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
                                    text: "حدد الوقت",
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    circleSelectTime(time: "03:00", desc: "ص"),
                                    circleSelectTime(time: "04:00", desc: "ص"),
                                    circleSelectTime(time: "05:00", desc: "ص"),
                                    circleSelectTime(time: "06:00", desc: "ص"),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: textHeadLine(
                                    text: "ذكرنى قبل",
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    circleSelectTime(time: "10", desc: "دقائق"),
                                    circleSelectTime(time: "15", desc: "دقيقة"),
                                    circleSelectTime(time: "30", desc: "دقيقة"),
                                    circleSelectTime(time: "60", desc: "دقيقة"),
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
                  text: "تأكيد",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationDetails(
                            docSpecialize: widget.docSpecialize,
                          ),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class circleSelectTime extends StatelessWidget {
  const circleSelectTime({
    super.key,
    required this.time,
    required this.desc,
  });
  final String time;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffFAF5F4),
      minRadius: 30,
      maxRadius: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textDescription(text: time),
          textDescription(text: desc),
        ],
      ),
    );
  }
}
