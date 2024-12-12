import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/services/fire_store_service.dart';

Dialog deletDialog(
  context, {
  required String userId,
  required String consultationId,
}) {
  return Dialog(
    surfaceTintColor: Colors.white,
    insetPadding: const EdgeInsets.all(25), // the space around the dialog
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
            const Text(
              "do you want to delete this patient from the consultation",
              textAlign: TextAlign.center,
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
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      FireStoreService().updateStatusConsultationsData(
                        userId: userId,
                        consultationId: consultationId,
                        status: tr("canceled"),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "yes delete the patient",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                "No don't delete",
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
