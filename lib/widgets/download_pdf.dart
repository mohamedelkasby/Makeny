import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:io';

Future<void> saveAsPDF(BuildContext context,
    {required screenshotController}) async {
  // Show loading overlay
  final overlayEntry = _showLoadingOverlay(context);

  try {
    // Capture the widget as an image
    Uint8List? screenshot = await screenshotController.capture();

    // Remove loading overlay
    overlayEntry.remove();

    if (screenshot != null) {
      // Create a PDF document
      final pdf = pw.Document();

      // Add the captured image to the PDF
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Center(
            child: pw.Image(pw.MemoryImage(screenshot)),
          ),
        ),
      );

      // Show bottom sheet with save/share options
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext bottomSheetContext) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.save_alt,
                    color: mainColor,
                  ),
                  title: Text(tr("save_to_loc_storage")),
                  onTap: () async {
                    // Show loading overlay for download
                    final downloadOverlay = _showLoadingOverlay(context);
                    Navigator.pop(bottomSheetContext);

                    try {
                      await _saveToDownloads(context, pdf);
                    } finally {
                      // Always remove the overlay
                      downloadOverlay.remove();
                    }
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: mainColor,
                  ),
                  title: Text(tr("share_pdf")),
                  onTap: () async {
                    // Show loading overlay for sharing
                    final shareOverlay = _showLoadingOverlay(context);
                    Navigator.pop(bottomSheetContext);

                    try {
                      await Printing.sharePdf(
                          bytes: await pdf.save(),
                          filename: 'profile_file.pdf');
                    } finally {
                      // Always remove the overlay
                      shareOverlay.remove();
                    }
                  },
                ),
              ],
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(tr("error.failed_capture"))),
      );
    }
  } catch (e) {
    // Ensure loading overlay is removed in case of error
    overlayEntry.remove();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: $e")),
    );
  }
}

// Reusable loading overlay method ****
OverlayEntry _showLoadingOverlay(BuildContext context) {
  // Create an overlay entry
  final overlayEntry = OverlayEntry(
    builder: (context) => Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(mainColor300),
        ),
      ),
    ),
  );

  // Insert the overlay into the screen
  Overlay.of(context).insert(overlayEntry);

  return overlayEntry;
}

Future<void> _saveToDownloads(BuildContext context, pw.Document pdf) async {
  try {
    Directory? saveDirectory;

    if (Platform.isAndroid) {
      // Android Scoped Storage
      saveDirectory = await _getAndroidDownloadsDirectory(context);
    } else if (Platform.isIOS) {
      // iOS Documents Directory
      saveDirectory = await getApplicationDocumentsDirectory();
    }

    if (saveDirectory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(tr("error.could't_find_directory"))),
      );
      return;
    }

    // Create a unique filename
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final filename = 'Makeny_Profile_$timestamp.pdf';
    final file = File('${saveDirectory.path}/$filename');

    // Save PDF to file
    await file.writeAsBytes(await pdf.save());

    // Notify the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(tr("pdf_saved")),
        action: SnackBarAction(
          label: tr("open"),
          textColor: Colors.white,
          onPressed: () {
            OpenFile.open(file.path);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(tr("error.error_saving_the_file"))),
    );
    print('Error saving file: $e');
  }
}

Future<Directory?> _getAndroidDownloadsDirectory(BuildContext context) async {
  try {
    // Check if the app has permission for storage access
    if (await Permission.storage.request().isGranted) {
      // Android Scoped Storage: Use '/storage/emulated/0/Download'
      return Directory('/storage/emulated/0/Download');
    } else {
      // Show an error if permission is denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(tr("error.permission_denied"))),
      );
      return null;
    }
  } catch (e) {
    print('Error accessing Android Downloads directory: $e');
    return null;
  }
}
