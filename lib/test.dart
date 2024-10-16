import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/widgets/default_text_form.dart';

Future<void> main(List<String> args) async {
  runApp(LoginForm());
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController inputController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isEmailValid = true;
  bool isEmailEntered = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    inputController.addListener(_onInputChanged);
  }

  void _onInputChanged() {
    final bool isEmail =
        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(inputController.text);
    if (isEmail != isEmailEntered) {
      setState(() {
        isEmailEntered = isEmail;
      });
      if (isEmail) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    inputController.removeListener(_onInputChanged);
    inputController.dispose();
    passController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "تسجيل دخول",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            DefaultTextForm(
              onchange: (value) {
                setState(() {
                  isEmailValid = true;
                });
              },
              label: "رقم الهاتف",
              hintText: "رقم الهاتف او البريد",
              controller: inputController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "إدخل رقم هاتفك او البريد الخاص بك";
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'يرجى إدخال بريد إلكتروني صحيح';
                } else if (!isEmailValid) {
                  return "البريد الالكترونى او الباسورد غير صحيح.";
                }
                return null;
              },
            ),
            SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1,
              child: BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  return DefaultTextForm(
                    onchange: (value) {
                      setState(() {
                        isEmailValid = true;
                      });
                    },
                    label: "كلمة المرور",
                    controller: passController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "ادخل كلمة المرور من فضلك.";
                      } else if (value.length < 8) {
                        return 'كلمة المرور لا بجب ان تقل عن 8 احرف';
                      }
                      return null;
                    },
                    icon: IconButton(
                      icon: Icon(
                        AppCubit.get(context).secure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        AppCubit.get(context).isSecure();
                      },
                    ),
                    obscure: AppCubit.get(context).secure,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
