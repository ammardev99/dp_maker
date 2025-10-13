// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerController extends GetxController {
//   final Rx<File?> selectedImage = Rx<File?>(null);
//   final ImagePicker _picker = ImagePicker();

//   Future<void> pickFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera, imageQuality: 85);
//     if (pickedFile != null) {
//       selectedImage.value = File(pickedFile.path);
//     }
//   }

//   Future<void> pickFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
//     if (pickedFile != null) {
//       selectedImage.value = File(pickedFile.path);
//     }
//   }

//   void clearImage() {
//     selectedImage.value = null;
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  final ImagePicker _picker = ImagePicker();

  /// Pick image from camera
  Future<File?> pickFromCamera() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint("Error picking image from camera: $e");
      return null;
    }
  }
}
