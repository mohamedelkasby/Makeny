import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadBottomSheet extends StatefulWidget {
  @override
  _FileUploadBottomSheetState createState() => _FileUploadBottomSheetState();
}

class _FileUploadBottomSheetState extends State<FileUploadBottomSheet> {
  File? _pickedImage; // تغير اسم المتغير ليكون أكثر وضوحًا

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      // قم بإضافة امتدادات الصور المسموحة هنا
    );

    if (result != null) {
      setState(() {
        _pickedImage = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          body: BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('اختر صورة'),
                    ),
                    if (_pickedImage != null) Text(_pickedImage!.path),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
