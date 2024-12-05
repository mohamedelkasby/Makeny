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
    this.onTestCompletion,
    this.onDataCollected,
  });
  final List<String> yesOrNoQuestions;
  final Function(bool)? onTestCompletion;
  final Function(Map<String, dynamic>)? onDataCollected;

  @override
  State<TestNumber1> createState() => _TestNumber1State();
}

class _TestNumber1State extends State<TestNumber1> {
  bool yesquestionsAnswered = false;
  List<int?> yesNoAnswers = [];

  TextEditingController lengthTextController = TextEditingController();
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
    lengthTextController.addListener(updateBodyMass);
    wightTextController.addListener(updateBodyMass);
    lengthTextController.addListener(checkTestCompletion);
    wightTextController.addListener(checkTestCompletion);
    waistTextController.addListener(checkTestCompletion);
    neckTextController.addListener(checkTestCompletion);
    pulseTextController.addListener(checkTestCompletion);
    oxygenTextController.addListener(checkTestCompletion);
    systolicBloodTextController.addListener(checkTestCompletion);
    diastolicBloodTextController.addListener(checkTestCompletion);
    cholesterolTextController.addListener(checkTestCompletion);
    beneficialTriTextController.addListener(checkTestCompletion);
    lengthTextController.addListener(checkTestCompletion);
    wightTextController.addListener(collectData);
    waistTextController.addListener(collectData);
    neckTextController.addListener(collectData);
    pulseTextController.addListener(collectData);
    oxygenTextController.addListener(collectData);
    systolicBloodTextController.addListener(collectData);
    diastolicBloodTextController.addListener(collectData);
    cholesterolTextController.addListener(collectData);
    beneficialTriTextController.addListener(collectData);
  }

  void collectData() {
    // print("there is some problem here ");
    if (areAllFieldsFilled()) {
      // Collect and send data
      widget.onDataCollected?.call({
        'yesNoQuestions': yesNoAnswers,
        'length': double.parse(lengthTextController.text),
        'weight': double.parse(wightTextController.text),
        'bmi': double.parse(bodyMassTextController.text),
        'waist': double.parse(waistTextController.text),
        'neck': double.parse(neckTextController.text),
        'pulse': pulseTextController.text,
        'oxygenLevel': oxygenTextController.text,
        'systolicBloodPressure': systolicBloodTextController.text,
        'diastolicBloodPressure': diastolicBloodTextController.text,
        'cholesterol': cholesterolTextController.text,
        'triglycerides': beneficialTriTextController.text,
      });
    }
  }

  bool areAllFieldsFilled() {
    bool isAllEntered = lengthTextController.text.isNotEmpty &&
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
    return isAllEntered;
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

    double bmi = weightInKg / (heightInMeters * heightInMeters);

    return double.parse(bmi.toStringAsFixed(1));
  }

  void updateBodyMass() {
    // Parse the height and weight
    double height = double.tryParse(lengthTextController.text) ?? 0;
    double weight = double.tryParse(wightTextController.text) ?? 0;

    // Get the selected units
    String heightUnit =
        lengthTextController.text.isNotEmpty ? selectedHeightUnit : '';
    String weightUnit =
        wightTextController.text.isNotEmpty ? selectedWeightUnit : '';

    if (height > 0 && weight > 0) {
      double bmi = calculateBMI(height, weight, heightUnit, weightUnit);
      bodyMassTextController.text = bmi.toString();
    }
  }

  void checkTestCompletion() {
    // Check if all questions are answered
    bool isComplete = yesquestionsAnswered && areAllFieldsFilled();
    // Call the completion callback if provided
    setState(() {
      widget.onTestCompletion?.call(isComplete);
    });
  }

  @override
  void dispose() {
    lengthTextController.removeListener(updateBodyMass);
    wightTextController.removeListener(updateBodyMass);
    lengthTextController.removeListener(checkTestCompletion);
    wightTextController.removeListener(checkTestCompletion);
    waistTextController.removeListener(checkTestCompletion);
    neckTextController.removeListener(checkTestCompletion);
    pulseTextController.removeListener(checkTestCompletion);
    oxygenTextController.removeListener(checkTestCompletion);
    systolicBloodTextController.removeListener(checkTestCompletion);
    diastolicBloodTextController.removeListener(checkTestCompletion);
    cholesterolTextController.removeListener(checkTestCompletion);
    beneficialTriTextController.removeListener(checkTestCompletion);
    lengthTextController.removeListener(collectData);
    wightTextController.removeListener(collectData);
    waistTextController.removeListener(collectData);
    neckTextController.removeListener(collectData);
    pulseTextController.removeListener(collectData);
    oxygenTextController.removeListener(collectData);
    systolicBloodTextController.removeListener(collectData);
    diastolicBloodTextController.removeListener(collectData);
    cholesterolTextController.removeListener(collectData);
    beneficialTriTextController.removeListener(collectData);
    // Dispose controllers
    lengthTextController.dispose();
    wightTextController.dispose();
    bodyMassTextController.dispose();
    waistTextController.dispose();
    neckTextController.dispose();
    pulseTextController.dispose();
    oxygenTextController.dispose();
    systolicBloodTextController.dispose();
    diastolicBloodTextController.dispose();
    cholesterolTextController.dispose();
    beneficialTriTextController.dispose();
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
                  yesquestionsAnswered = allAnswered;
                });
                collectData();
              },
              onAnswersChanged: (answers) {
                yesNoAnswers = answers;
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
              qustionText: tr("accountPage.length"),
              controller: lengthTextController,
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
              keyboardType: TextInputType.text,
              getSlash: true,
            ),
            CustomListField(
              qustionText: tr("oxygen_level"),
              hintText: "100/90",
              controller: oxygenTextController,
              keyboardType: TextInputType.text,
              getSlash: true,
            ),
            CustomListField(
              qustionText: tr("systolic_blood_pressure"),
              hintText: "140/100",
              suffixList: [tr("calculates.mmHg")],
              controller: systolicBloodTextController,
              keyboardType: TextInputType.text,
              getSlash: true,
            ),
            CustomListField(
              qustionText: tr("diastolic_blood_pressure"),
              hintText: "80/60",
              suffixList: [tr("calculates.mmHg")],
              controller: diastolicBloodTextController,
              keyboardType: TextInputType.text,
              getSlash: true,
            ),
            CustomListField(
              qustionText: tr("cholesterol"),
              hintText: "5.2/0",
              controller: cholesterolTextController,
              keyboardType: TextInputType.text,
              getSlash: true,
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
