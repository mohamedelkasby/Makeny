import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/user_model.dart';
import 'package:makeny/services/fire_store_service.dart';
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
  final TextEditingController birthDayController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController currentJobController = TextEditingController();
  String? selectedEducationLevel;
  String? selectedMaritalStatus;
  String? selectedGender;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                qustionText: "تاريخ الميلاد ",
                hintText: "ي/ش/س",
                controller: birthDayController,
                keyboardType: TextInputType.datetime,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/icons/calender.svg"),
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
