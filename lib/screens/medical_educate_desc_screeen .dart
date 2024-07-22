import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/medical_educate_model.dart';

import 'package:makeny/widgets/defualt_appbar.dart';

class MedicalEducateDescScreen extends StatelessWidget {
  final MedicalEducateModel dataModel;

  const MedicalEducateDescScreen({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "تثقيف طبي"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              // color: greyborderColor,
              width: double.infinity,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  dataModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            dataModel.longDescription
          ],
        ),
      ),
    );
  }
}
