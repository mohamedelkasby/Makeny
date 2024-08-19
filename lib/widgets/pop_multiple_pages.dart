import 'package:flutter/material.dart';

void popMultiplePages({
  required BuildContext context,
  required int pagesToPop,
  dynamic data,
}) {
  int count = 1;
  Navigator.of(context).popUntil((route) {
    if (count == pagesToPop) return true;
    count++;
    return false;
  });

  // Pass data to the new top page
  if (data != null) {
    Navigator.of(context).pop(data);
  } else {
    Navigator.of(context).pop();
  }
}
