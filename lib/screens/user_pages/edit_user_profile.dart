import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_list_field.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class EditUserProfile extends StatelessWidget {
  const EditUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: LinearProgressIndicator(
                color: mainColor,
                backgroundColor: mainColor100,
                minHeight: 6,
                borderRadius: BorderRadius.circular(50),
                value: (1 / 10),
              ),
            ),
            const CustomListField(
              qustionText: "الاسم بالكامل",
              keyboardType: TextInputType.name,
            ),
            const CustomListField(qustionText: "رقم الهوية"),
            const CustomListField(qustionText: "البريد الالكتروني"),
            const CustomListField(
              qustionText: "الجوال",
              suffixText: "+999  |",
            ),
            const CustomListField(
              qustionText: "تاريخ الميلاد ",
              hintText: "ي/ش/س",
              suffixIcon: Icon(Icons.abc),
            ),
            //    the drop down
            const CustomDropDwonList(
              label: "الحالة الاجتماعية",
              listItems: ["متزوج ", "اعزب", "ارمل", "مطلق"],
            ),
            const CustomDropDwonList(
              label: "النوع",
              listItems: ["ذكر", "انثي"],
            ),
            const CustomDropDwonList(
              label: "المستوى التعليمي",
              listItems: ["طالب", "بكالوريوس", "ماجستير", "دكتوراه"],
            ),
            const CustomListField(qustionText: "العمل الحالي"),
            defaultButton(text: "حفظ", onTap: () {})
          ],
        ),
      ),
    );
  }
}

class CustomDropDwonList extends StatefulWidget {
  const CustomDropDwonList({
    super.key,
    required this.listItems,
    required this.label,
  });
  final List<String> listItems;
  final String label;

  @override
  State<CustomDropDwonList> createState() => _CustomDropDwonListState();
}

class _CustomDropDwonListState extends State<CustomDropDwonList> {
  late List<String> gender = widget.listItems;
  late String selectedList = gender[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: defalutQuestionText(text: widget.label),
        ),
        Container(
          width: double.infinity,
          // margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffcfcfd0))),
          child: DropdownButton<String>(
            isExpanded:
                true, // هذا سيسمح للـ DropdownButton بأخذ العرض الكامل للـ Container
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            value: selectedList,
            style: TextStyle(
              fontSize: 16,
              color: greyColor,
              fontFamily: "cairo",
              fontWeight: FontWeight.w300,
            ),
            underline: const SizedBox(),
            items: gender.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(value),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedList = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }
}
