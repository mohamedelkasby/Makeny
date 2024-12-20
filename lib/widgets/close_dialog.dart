import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/user_screens/sign_in_&_sign_up_screens/login_screen.dart';

Dialog closeDialog(context) {
  return Dialog(
    surfaceTintColor: Colors.white,
    insetPadding: EdgeInsets.all(25), // the space around the dialog
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(15), // the border radius of the dialog
    ),
    ///// we put the material to add some control to the shadow
    child: Material(
      elevation: 10, // Control the shadow depth here
      shadowColor: Colors.black
          .withOpacity(0.8), // Control the shadow color and transparency
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 30, 20, 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tr("closeDialog.do_you_want_sign_out"),
              style: TextStyle(
                fontSize: 21,
                color: Color(0xff777777),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: mainColor,
                ),
                width: double.infinity,
                height: 54,
                child: BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    return MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        AppCubit.get(context).selectedBNBIndex = 0;
                        AppCubit.get(context).saveLogged("non");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        tr("closeDialog.yes_sign_out"),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                tr("closeDialog.no_stay"),
                style: TextStyle(
                  color: Color(0xffA2A2A2),
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
