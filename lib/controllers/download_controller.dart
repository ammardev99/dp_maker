// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart';
// import 'package:permission_handler/permission_handler.dart';

// class DownloadController extends GetxController {
//   Future<String?> downloadImage(File file, {String fileName = 'dp_frame.png'}) async {
//     try {
//       final status = await Permission.storage.request();
//       if (!status.isGranted) return null;

//       final directory = await getExternalStorageDirectory();
//       final path = '${directory!.path}/$fileName';
//       final bytes = await file.readAsBytes();
//       final newFile = File(path);
//       await newFile.writeAsBytes(bytes);
//       return path;
//     } catch (e) {
//       print('Download Error: $e');
//       return null;
//     }
//   }
// }

