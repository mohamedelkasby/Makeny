import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/extentions/colors.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({super.key});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  File? selectedImage;

  ///
  final ImagePicker picker = ImagePicker();
  // bool isUploading = false;

  String userId = FirebaseAuth.instance.currentUser!.uid;

  // References to Firebase services
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadImageToFirebase(File imageFile) async {
    if (userId.isEmpty) return;

    // setState(() {
    //   isUploading = true;
    // });

    try {
      // Create a unique file name
      String fileName =
          'user_images/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Create storage reference
      Reference storageRef = _storage.ref().child(fileName);

      // Upload the file
      await storageRef.putFile(
        imageFile,
        SettableMetadata(contentType: 'image/jpeg'),
      );

      // Get the download URL
      String downloadUrl = await storageRef.getDownloadURL();

      // Update Firestore user document
      await _firestore.collection('users').doc(userId).update({
        'picture': downloadUrl,
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile image updated successfully!')),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading image: ${e.toString()}')),
      );
      print(e.toString());
    }
  }

  ///
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
          AppCubit.get(context).saveImage(pickedFile.path);
          print("............ ${AppCubit.get(context).profileImage}");
        });
        // Upload to Firebase
        // await uploadImageToFirebase(selectedImage!);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void showImagePreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AppCubit.get(context).profileImage != ""
                      ? Image.file(
                          File(AppCubit.get(context).profileImage),
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.person,
                          size: MediaQuery.sizeOf(context).width * .57,
                          color: mainColor300,
                        ),
                ),
                // Semi-transparent overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          mainColor300.withOpacity(0.9),
                          mainColor100.withOpacity(.0),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        pickImage();
                      },
                      child: const Text(
                        'تغير الصورة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // Close button
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _firestore.collection('users').doc(userId).get(),
      builder: (context, snapshot) {
        String? imageUrl = snapshot.data?.get('picture') as String?;

        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return InkWell(
                onTap: () => showImagePreview(context),
                child: AppCubit.get(context).profileImage != ""
                    ? Image.file(
                        File(AppCubit.get(context).profileImage),
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.person,
                        size: 65,
                        color: mainColor300,
                      ),
                // selectedImage != null
                //     ? Image.file(
                //         selectedImage!,
                //         width: 65,
                //         height: 65,
                //         fit: BoxFit.cover,
                //       )
                //     //TODO: this need money to store image to the internet.

                //     : imageUrl != "" && imageUrl != null
                //         ? Image.network(
                //             imageUrl,
                //             width: 65,
                //             height: 65,
                //             fit: BoxFit.cover,
                //             loadingBuilder: (context, child, loadingProgress) {
                //               if (loadingProgress == null) return child;
                //               return Container(
                //                 width: 65,
                //                 height: 65,
                //                 color: Colors.grey[200],
                //                 child: const Center(
                //                   child: CircularProgressIndicator(),
                //                 ),
                //               );
                //             },
                //           )
                //         : Icon(
                //             Icons.person,
                //             size: 65,
                //             color: mainColor300,
                //           ),
              );
            },
          ),
        );
      },
    );
  }
}
