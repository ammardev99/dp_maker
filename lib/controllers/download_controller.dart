import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class DPController extends GetxController {
  final GlobalKey dpKey = GlobalKey();

  /// Download DP from a specific RepaintBoundary key
  Future<void> downloadDP({GlobalKey? customKey}) async {
    if (!await requestStoragePermission()) {
      Fluttertoast.showToast(msg: '⚠️ Storage permission required.');
      return;
    }

    try {
      final boundaryKey = customKey ?? dpKey;
      final boundary = boundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

      if (boundary == null) {
        Fluttertoast.showToast(msg: '⚠️ Unable to capture DP (no render boundary found).');
        return;
      }

      final uiImage = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await uiImage.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        Fluttertoast.showToast(msg: '⚠️ Could not process image bytes.');
        return;
      }

      final pngBytes = byteData.buffer.asUint8List();

      final downloadsDir = Directory('/storage/emulated/0/Download');
      if (!downloadsDir.existsSync()) {
        try {
          downloadsDir.createSync(recursive: true);
        } catch (e) {
          Fluttertoast.showToast(msg: '⚠️ Failed to create Downloads folder: $e');
          return;
        }
      }

      final now = DateTime.now();
      final fileName = 'dp_maker_${DateFormat("yyMMdd_HHmmss").format(now)}.jpg';
      final filePath = '${downloadsDir.path}/$fileName';

      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      await refreshGallery(file.path);
      Fluttertoast.showToast(msg: '✅ DP saved to Downloads/$fileName');
    } catch (e) {
      Fluttertoast.showToast(msg: '❌ Failed to save DP: $e');
    }
  }

  Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      try {
        if (await Permission.manageExternalStorage.isGranted) return true;
        if (await Permission.manageExternalStorage.request().isGranted) return true;
        if (await Permission.storage.isGranted) return true;
        if (await Permission.storage.request().isGranted) return true;
        if (await Permission.photos.isGranted) return true;
        if (await Permission.photos.request().isGranted) return true;

        Fluttertoast.showToast(msg: '❌ Storage permission denied by user.');
        return false;
      } catch (e) {
        Fluttertoast.showToast(msg: '⚠️ Permission check failed: $e');
        return false;
      }
    }
    return true;
  }

Future<void> refreshGallery(String filePath) async {
  try {
    const channel = MethodChannel('media_scanner');
    await channel.invokeMethod('scanFile', {'path': filePath});
  // ignore: unused_catch_stack
  } catch (e, stack) {
    Fluttertoast.showToast(msg: 'Check File Manager Downloads folder.');
    // Fluttertoast.showToast(msg: '⚠️ Gallery refresh failed: $e');
    // debugPrint('⚠️ Gallery refresh failed: $e');
    // debugPrintStack(label: 'Gallery refresh stack trace:', stackTrace: stack);
  }
}









}
