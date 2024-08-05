import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

class DefaultTextForm extends StatelessWidget {
  const DefaultTextForm({
    super.key,
    this.hintText = "",
    this.label = "",
    this.icon = const SizedBox(),
    this.value = "",
  });

  final String label; // = "";
  final String hintText;
  final Widget icon; //= const SizedBox();
  final String value; // = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == ""
            ? SizedBox()
            : Column(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 17,
                      color: mainBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: icon,
            //////////
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: greyborderColor.withOpacity(.6),
              ),
            ),
            fillColor: Colors.white.withOpacity(.8),
            filled: true,

            ///////////
          ),
          initialValue: value,
        ),
        label == ""
            ? SizedBox()
            : SizedBox(
                height: 7,
              )
      ],
    );
  }
}

// Widget defaultTextForm({
//   final String label = "",
//   final String hintText = "",
//   final Widget icon = const SizedBox(),
//   final String value = "",
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       label == ""
//           ? SizedBox()
//           : Column(
//               children: [
//                 Text(
//                   label,
//                   style: TextStyle(
//                     fontSize: 17,
//                     color: mainBlack,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//               ],
//             ),
//       TextFormField(
//         decoration: InputDecoration(
//           hintText: hintText,
//           suffixIcon: icon,
//           //////////
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.transparent),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//               color: greyborderColor.withOpacity(.6),
//             ),
//           ),
//           fillColor: Colors.white.withOpacity(.8),
//           filled: true,

//           ///////////
//         ),
//         initialValue: value,
//         onChanged: (value) {
//           /// TODO: edite the name of the user
//         },
//       ),
//       label == ""
//           ? SizedBox()
//           : SizedBox(
//               height: 7,
//             )
//     ],
//   );
// }
