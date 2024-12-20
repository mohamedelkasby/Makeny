import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/user_model.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_list_field.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/drop_dwon_list.dart';
import 'package:makeny/widgets/navigation_utils.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({
    super.key,
    required this.data,
  });
  final UserModel data;
  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController currentJobController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedEducationLevel;
  String? selectedMaritalStatus;
  String? selectedGender;
  String? selectedDate;
  DateTime timeStamp = DateTime.now();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  int age = 0;

  int filledFields = 1;

  @override
  void initState() {
    selectedEducationLevel = widget.data.educationLevel;
    selectedGender = widget.data.gender;
    selectedMaritalStatus = widget.data.maritalStatus;
    timeStamp = widget.data.birthDate!.toDate() ?? DateTime.now();

    selectedDate =
        DateFormat('dd-MM-yyyy').format(widget.data.birthDate!.toDate());

    super.initState();
  }

  void fileLinearProgress() {
    if (userNameController.text.isNotEmpty) filledFields++;
    if (idNumberController.text.isNotEmpty) filledFields++;
    if (emailController.text.isNotEmpty) filledFields++;
    if (phoneNumberController.text.isNotEmpty) filledFields++;
    if (selectedMaritalStatus != null) filledFields++;
    if (selectedEducationLevel != null) filledFields++;
    if (selectedGender != null) filledFields++;
    if (currentJobController.text.isNotEmpty) filledFields++;
  }

  @override
  Widget build(BuildContext context) {
    fileLinearProgress();

    return Scaffold(
      appBar: defaultAppbar(context, title: tr("accountPage.personla_profile")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                // the linear progress
                child: LinearProgressIndicator(
                  color: mainColor,
                  backgroundColor: mainColor100,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(50),
                  value: (filledFields / 9),
                ),
              ),
              CustomListField(
                qustionText: tr("accountPage.full_name"),
                controller: userNameController,
                keyboardType: TextInputType.name,
                value: widget.data.name,
              ),
              CustomListField(
                qustionText: tr("accountPage.id_number"),
                controller: idNumberController,
                keyboardType: TextInputType.number,
                value: widget.data.idNumber.toString() == 0.toString()
                    ? null
                    : widget.data.idNumber.toString(),
                onlyNumber: true,
              ),
              CustomListField(
                qustionText: tr("accountPage.email"),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                value: widget.data.email,
                readOnly: true,
              ),
              CustomListField(
                qustionText: tr("accountPage.phone_number"),
                suffixText:
                    context.locale.languageCode == "ar" ? "|  699+" : "",
                prefixText:
                    context.locale.languageCode == "en" ? "+699  |" : "",
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                value: widget.data.phoneNumber,
                // onlyNumber: true,
              ),
              CustomListField(
                readOnly: true,
                qustionText: tr("accountPage.birth_date"),
                value: DateFormat('dd-MM-yyyy')
                    .format(widget.data.birthDate!.toDate()),
                controller: TextEditingController(text: selectedDate),
                // keyboardType: TextInputType.datetime,
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
                          doneStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          cancelStyle: const TextStyle(color: Colors.white),
                        ),
                        minTime: DateTime.now()
                            .subtract(const Duration(days: 120 * 365)),
                        maxTime: DateTime.now(),
                        onConfirm: (date) {
                          setState(() {
                            selectedDate =
                                DateFormat('dd-MM-yyyy').format(date);
                            timeStamp = date;
                          });
                        },
                        currentTime: DateTime.now(),
                        locale: context.locale.languageCode == "ar"
                            ? LocaleType.ar
                            : LocaleType.en,
                      );
                    },
                    child: SvgPicture.asset("assets/icons/calender.svg"),
                  ),
                ),
              ),
              //    the drop down

              CustomDropDownList(
                items: [
                  tr("accountPage.married"),
                  tr("accountPage.single"),
                  tr("accountPage.widowed"),
                  tr("accountPage.divorced")
                ],
                label: tr("accountPage.marital_status"),
                selectedValue: selectedMaritalStatus,
                onChanged: (value) {
                  setState(() {
                    selectedMaritalStatus = value!;
                  });
                },
              ),
              CustomDropDownList(
                label: tr("accountPage.gender"),
                items: [tr("accountPage.male"), tr("accountPage.female")],
                selectedValue: selectedGender,
                onChanged: (value) {
                  selectedGender = value!;
                },
              ),
              CustomDropDownList(
                label: tr("accountPage.education_level"),
                items: [
                  tr("accountPage.student"),
                  tr("accountPage.bachelor"),
                  tr("master"),
                  tr("doctorate")
                ],
                selectedValue: selectedEducationLevel,
                onChanged: (value) {
                  selectedEducationLevel = value!;
                },
              ),
              CustomListField(
                qustionText: tr("accountPage.current_job"),
                controller: currentJobController,
                keyboardType: TextInputType.name,
                value: widget.data.currentJob,
              ),
              defaultButton(
                  text: tr("save"),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      FireStoreService().updateDataToFirestore(
                        userId: firebaseAuth.currentUser!.uid,
                        usermodel: UserModel(
                          name: userNameController.text,
                          birthDate: Timestamp.fromDate(timeStamp),
                          gender: selectedGender!,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          idNumber: int.parse(idNumberController.text),
                          educationLevel: selectedEducationLevel!,
                          currentJob: currentJobController.text,
                          maritalStatus: selectedMaritalStatus!,
                        ),
                      );
                      // don't remember what is this do ?? not sure too.
                      NavigationUtils.refreshPage?.call();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
