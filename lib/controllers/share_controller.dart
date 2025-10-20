// // later on implement share functionality

// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class ShareController extends GetxController {
//   /// Capture the widget inside [customKey] as an image and share it
//   Future<void> shareDP({required GlobalKey customKey}) async {
//     try {
//       // 1️⃣ Convert widget to image bytes
//       RenderRepaintBoundary boundary =
//           customKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//       var image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();

//       // 2️⃣ Save to temporary file
//       final tempDir = await getTemporaryDirectory();
//       final file = await File('${tempDir.path}/shared_dp.png').create();
//       await file.writeAsBytes(pngBytes);

//       // 3️⃣ Share file using share_plus
//       // ignore: deprecated_member_use
//       await Share.shareXFiles([
//         XFile(file.path),
//       ], text: 'Check out my new DP! 🖼️');
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error while sharing: $e");
//     }
//   }
// }
