import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_list_field.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class EditUserProfile extends StatelessWidget {
  const EditUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "الملف الشخصي"),
      body: Column(
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
          CustomListField(qustionText: "الاسم بالكامل"),
          CustomListField(qustionText: "رقم الهوية"),
          CustomListField(qustionText: "البريد الالكتروني"),
          CustomListField(
            qustionText: "الجوال",
            suffixText: "+999  |",
          ),
          CustomListField(
            qustionText: "تاريخ الميلاد ",
            hintText: "ي/ش/س",
          ),
          //    the drop down
          CustomDropDwonList(
            gender: ["ذكر", "انثي"],
          ),

          CustomListField(qustionText: "العمل الحالي"),
        ],
      ),
    );
  }
}

class CustomDropDwonList extends StatefulWidget {
  const CustomDropDwonList({
    super.key,
    required this.gender,
  });
  final List<String> gender;

  @override
  State<CustomDropDwonList> createState() => _CustomDropDwonListState();
}

class _CustomDropDwonListState extends State<CustomDropDwonList> {
  late List<String> gender = widget.gender;
  late String selectedList = gender[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xffcfcfd0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            value: selectedList,
            style: TextStyle(
              fontSize: 16,
              color: greyColor,
              fontFamily: "cairo",
              fontWeight: FontWeight.w300,
            ),
            underline: SizedBox(),
            items: gender.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedList = newValue!;
              });
            },
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
        ],
      ),
    );
  }
}
