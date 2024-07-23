import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/medical_educate_model.dart';
import 'package:makeny/screens/medical_educate_desc_screeen%20.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class MedicalEducateHeadScreen extends StatelessWidget {
  const MedicalEducateHeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "تثقيف طبي"),
      body: ListView.builder(
        itemCount: medicalEducateList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return educateCard(
            context,
            dataModel: medicalEducateList[index],
          );
        },
      ),
    );
  }
}

Widget educateCard(
  context, {
  required final MedicalEducateModel dataModel,
}) {
  return InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicalEducateDescScreen(dataModel: dataModel),
      ),
    ),
    child: Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.sizeOf(context).width - 10,
      height: MediaQuery.sizeOf(context).width - 10,
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: greyborderColor,
                  blurRadius: 10,
                  spreadRadius: -7.5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                dataModel.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //////////// the gradient shadow
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              verticalDirection: VerticalDirection.up,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataModel.shortDescription,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.7),
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: textHeader(
                    text: dataModel.headLine,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
