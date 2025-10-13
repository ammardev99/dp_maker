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
