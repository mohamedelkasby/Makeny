import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/widgets/custom_list_field.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class TestNumber1 extends StatefulWidget {
  const TestNumber1({
    super.key,
    this.yesOrNoQuestions = const [],
  });
  final List<String> yesOrNoQuestions;

  @override
  State<TestNumber1> createState() => _TestNumber1State();
}

class _TestNumber1State extends State<TestNumber1> {
  bool allQuestionsAnswered = false;
  TextEditingController tallTextController = TextEditingController();
  TextEditingController wightTextController = TextEditingController();
  TextEditingController bodyMassTextController = TextEditingController();
  TextEditingController waistTextController = TextEditingController();
  TextEditingController neckTextController = TextEditingController();
  TextEditingController pulseTextController = TextEditingController();
  TextEditingController oxygenTextController = TextEditingController();
  TextEditingController systolicBloodTextController = TextEditingController();
  TextEditingController diastolicBloodTextController = TextEditingController();
  TextEditingController cholesterolTextController = TextEditingController();
  TextEditingController beneficialTriTextController = TextEditingController();
  String selectedHeightUnit = tr("calculates.cm");
  String selectedWeightUnit = tr("calculates.kg");

  @override
  initState() {
    super.initState();
    tallTextController.addListener(updateBodyMass);
    wightTextController.addListener(updateBodyMass);
  }

  bool areAllFieldsFilled() {
    return tallTextController.text.isNotEmpty &&
        wightTextController.text.isNotEmpty &&
        bodyMassTextController.text.isNotEmpty &&
        waistTextController.text.isNotEmpty &&
        neckTextController.text.isNotEmpty &&
        pulseTextController.text.isNotEmpty &&
        oxygenTextController.text.isNotEmpty &&
        systolicBloodTextController.text.isNotEmpty &&
        diastolicBloodTextController.text.isNotEmpty &&
        cholesterolTextController.text.isNotEmpty &&
        beneficialTriTextController.text.isNotEmpty;
  }

  double calculateBMI(
    double height,
    double weight,
    String heightUnit,
    String weightUnit,
  ) {
    // Convert height to meters
    double heightInMeters = heightUnit == tr("calculates.inch")
        ? height * 0.0254 // convert inches to meters
        : height / 100; // convert cm to meters

    // Convert weight to kilograms
    double weightInKg = weightUnit == tr("calculates.g")
        ? weight / 1000 // convert grams to kg
        : weight; // already in kg

    // Calculate BMI
    double bmi = weightInKg / (heightInMeters * heightInMeters);

    // Round to one decimal place
    return double.parse(bmi.toStringAsFixed(1));
  }

  void updateBodyMass() {
    // Parse the height and weight
    double height = double.tryParse(tallTextController.text) ?? 0;
    double weight = double.tryParse(wightTextController.text) ?? 0;

    // Get the selected units
    String heightUnit =
        tallTextController.text.isNotEmpty ? selectedHeightUnit : '';
    String weightUnit =
        wightTextController.text.isNotEmpty ? selectedWeightUnit : '';

    // Calculate BMI if both height and weight are provided
    if (height > 0 && weight > 0) {
      double bmi = calculateBMI(height, weight, heightUnit, weightUnit);
      bodyMassTextController.text = bmi.toString();
    }
  }

  @override
  void dispose() {
    tallTextController.removeListener(updateBodyMass);
    wightTextController.removeListener(updateBodyMass);

    // Dispose controllers
    tallTextController.dispose();
    wightTextController.dispose();
    bodyMassTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffD0FFBF)),
                  child: greenNote(
                    text: tr("green_note.test_1"),
                  )),
            ),
            YesOrNoQuestions(
              questionsText: widget.yesOrNoQuestions,
              onAllQuestionsAnswered: (allAnswered) {
                setState(() {
                  allQuestionsAnswered = allAnswered;
                });
              },
            ),
            CustomListField(
              suffixList: [
                tr("calculates.cm"),
                tr("calculates.inch"),
              ],
              onSuffixChanged: (value) {
                setState(() {
                  selectedHeightUnit = value;
                  updateBodyMass();
                });
              },
              qustionText: tr("accountPage.tall"),
              controller: tallTextController,
            ),
            CustomListField(
              suffixList: [
                tr("calculates.kg"),
                tr("calculates.g"),
              ],
              onSuffixChanged: (value) {
                setState(() {
                  selectedWeightUnit = value;
                  updateBodyMass();
                });
              },
              qustionText: tr("accountPage.wight"),
              controller: wightTextController,
            ),
            CustomListField(
              suffixText: tr("calculates.kg/m2"),
              qustionText: tr("medicalFile.body_mass"),
              enable: false,
              controller: bodyMassTextController,
            ),
            CustomListField(
              suffixList: [
                tr("calculates.cm"),
                tr("calculates.inch"),
              ],
              qustionText: tr("accountPage.waist"),
              controller: waistTextController,
            ),
            CustomListField(
              suffixList: [
                tr("calculates.cm"),
                tr("calculates.inch"),
              ],
              qustionText: tr("neck_circumference"),
              controller: neckTextController,
            ),
            CustomListField(
              suffixText: tr("calculates.pbm"),
              qustionText: tr("pulse"),
              hintText: "100/60",
              controller: pulseTextController,
            ),
            CustomListField(
              qustionText: tr("oxygen_level"),
              hintText: "100/90",
              controller: oxygenTextController,
            ),
            CustomListField(
              qustionText: tr("systolic_blood_pressure"),
              hintText: "140/100",
              suffixList: [tr("calculates.mmHg")],
              controller: systolicBloodTextController,
            ),
            CustomListField(
              qustionText: tr("diastolic_blood_pressure"),
              hintText: "80/60",
              suffixList: [tr("calculates.mmHg")],
              controller: diastolicBloodTextController,
            ),
            CustomListField(
              qustionText: tr("cholesterol"),
              hintText: "5.2/0",
              controller: cholesterolTextController,
            ),
            CustomListField(
              qustionText: tr("good_triglycerides"),
              hintText: "0",
              suffixList: [tr("calculates.cm")],
              controller: beneficialTriTextController,
            ),
          ],
        );
      },
    );
  }
}
