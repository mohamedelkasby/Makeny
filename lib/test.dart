import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

void main() {
  runApp(MyRadioList());
}

class MyRadioList extends StatefulWidget {
  @override
  _MyRadioListState createState() => _MyRadioListState();
}

class _MyRadioListState extends State<MyRadioList> {
  String? selectedOption;

  final List<String> options = ['Option ', 'Option 2', 'Option 3'];
  final List<bool> _isChecked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Column(
          children: List.generate(
            options.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  color: Colors.pink,
                  child: CheckboxListTile(
                    activeColor: mainColor,
                    title: Text(options[index]),
                    value: _isChecked[index],
                    onChanged: (bool? value) {
                      setState(
                        () {
                          _isChecked[index] = value!;
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}
