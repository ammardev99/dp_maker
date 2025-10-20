import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dp_maker/config/utils/my_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageCropperController {
  final ImagePicker _picker = ImagePicker();

  /// Pick and crop image from camera or gallery
  /// [fromCamera] = true for camera, false for gallery
  Future<File?> pickAndCropImage({required bool fromCamera}) async {
    try {
      // Pick image
      final XFile? pickedFile = await _picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      );

      if (pickedFile == null) return null;

      // Crop the image
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        // cropStyle: CropStyle.circle, // circle crop
        // aspectRatioPresets: [CropAspectRatioPreset.square],
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Drag the face center',
            toolbarColor: MyColors.primary,
            toolbarWidgetColor: Colors.white,
            // ignore: deprecated_member_use
            statusBarColor: MyColors.primaryDark,
            hideBottomControls: false,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Profile Image',
            aspectRatioLockEnabled: true,
          ),
        ],
      );

      if (croppedFile == null) return null;

      return File(croppedFile.path);
    } catch (e) {
      // ignore: avoid_print
      print("Error picking/cropping image: $e");
      return null;
    }
  }
}
