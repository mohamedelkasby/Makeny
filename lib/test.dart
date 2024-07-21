import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() {
  runApp(ffffff());
}

class ffffff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Verification Code'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: VerificationCodeInput(),
        ),
      ),
    );
  }
}

class VerificationCodeInput extends StatefulWidget {
  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        controller: _controller,
        autoDisposeControllers: false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          activeColor: Colors.grey,
          selectedColor: Colors.blue,
          inactiveColor: Colors.grey,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        onChanged: (value) {
          print(value);
        },
        beforeTextPaste: (text) {
          // Allow pasting
          return true;
        },
      ),
    );
  }
}
