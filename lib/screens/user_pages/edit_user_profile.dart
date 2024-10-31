import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;

import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_list_field.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/drop_dwon_list.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // TextEditingController birthDayController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController currentJobController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedEducationLevel;
  String? selectedMaritalStatus;
  String? selectedGender;
  String? selectedDate;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  int age = 0;

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    // Check if birthday hasn't occurred this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: LinearProgressIndicator(
                  color: mainColor,
                  backgroundColor: mainColor100,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(50),
                  value: (1 / 10),
                ),
              ),
              CustomListField(
                qustionText: "الاسم بالكامل",
                controller: userNameController,
                keyboardType: TextInputType.name,
              ),
              CustomListField(
                qustionText: "رقم الهوية",
                controller: idNumberController,
                keyboardType: TextInputType.number,
              ),
              CustomListField(
                qustionText: "البريد الالكتروني",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomListField(
                qustionText: "الجوال",
                suffixText: "+999  |",
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
              ),
              CustomListField(
                readOnly: true,
                qustionText: "تاريخ الميلاد ",
                hintText: "ي/ش/س",
                controller: TextEditingController(text: selectedDate),
                keyboardType: TextInputType.datetime,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        theme: DatePickerTheme(
                          headerColor: mainColor300,
                          itemStyle: TextStyle(
                            color: mainColor400,
                          ),
                          doneStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        minTime: DateTime.now()
                            .subtract(const Duration(days: 120 * 365)),
                        maxTime: DateTime.now(),
                        onConfirm: (date) {
                          setState(() {
                            selectedDate =
                                DateFormat('dd-MM-yyyy').format(date);
                            age = calculateAge(date);
                          });
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.ar,
                      );
                    },
                    child: SvgPicture.asset("assets/icons/calender.svg"),
                  ),
                ),
              ),
              //    the drop down
              CustomDropDownList(
                items: const ["متزوج ", "اعزب", "ارمل", "مطلق"],
                label: "الحالة الاجتماعية",
                selectedValue: selectedMaritalStatus,
                onChanged: (value) {
                  setState(() {
                    selectedMaritalStatus = value!;
                  });
                },
              ),
              CustomDropDownList(
                label: "النوع",
                items: const ["ذكر", "انثي"],
                selectedValue: selectedGender,
                onChanged: (value) {
                  selectedGender = value!;
                },
              ),
              CustomDropDownList(
                label: "المستوى التعليمي",
                items: const ["طالب", "بكالوريوس", "ماجستير", "دكتوراه"],
                selectedValue: selectedEducationLevel,
                onChanged: (value) {
                  selectedEducationLevel = value!;
                },
              ),
              CustomListField(
                qustionText: "العمل الحالي",
                controller: currentJobController,
                keyboardType: TextInputType.name,
              ),
              defaultButton(
                  text: "حفظ",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world, you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    }
                    // TODO:
                    // FireStoreService().updateToFirestore(
                    //   userId: firebaseAuth.currentUser!.uid,
                    //   usermodel: UserModel(
                    //     name: userNameController.text,
                    //     age: double.parse(birthDayController.text),
                    //     gender: selectedGender!,
                    //     email: emailController.text,
                    //     phoneNumber: phoneNumberController.text,
                    //     idNumber: double.parse(idNumberController.text),
                    //     educationLevel: selectedEducationLevel!,
                    //     currentJob: currentJobController.text,
                    //     maritalStatus: selectedMaritalStatus!,
                    //   ),
                    // );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
