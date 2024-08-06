import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screen.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class TestNumber3 extends StatefulWidget {
  const TestNumber3({
    super.key,
    this.yesOrNoQuestions,
  });

  final yesOrNoQuestions;

  @override
  _TestNumber3State createState() => _TestNumber3State();
}

class _TestNumber3State extends State<TestNumber3> {
  File? _pickedImage; // تغير اسم المتغير ليكون أكثر وضوحًا

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      // قم بإضافة امتدادات الصور المسموحة هنا
    );

    if (result != null) {
      setState(() {
        _pickedImage = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YesOrNoQustions(
          questionsText: widget.yesOrNoQuestions,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: defText(
              text: "ما هي الادوية التي تستخدمها حاليا ؟",
            ),
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: mainColor,
              )),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                child: Row(
                  children: [
                    _pickedImage != null
                        ? SizedBox()
                        : defText(
                            text: "مثل : الكورتيزول",
                            color: greyColor,
                          ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_pickedImage != null)
                          Image.file(
                            _pickedImage!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ), //
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: _pickImage,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: mainColor,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "ارفع صورة اوملف هنا ",
                      textAlign: TextAlign.center,
                    ),
                    // Text("data"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
