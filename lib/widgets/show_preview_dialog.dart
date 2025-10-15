import 'dart:io';
import 'dart:ui' as ui;
import 'package:dp_maker/widgets/custom_loading.dart';
import 'package:dp_maker/widgets/custom_user_dp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import '../config/config_io.dart';

final GlobalKey _dpKey = GlobalKey();

Future<void> _downloadDP(GlobalKey key) async {
  // 1️⃣ Request permission once
  if (!await _requestStoragePermission()) return;

  try {
    // 2️⃣ Capture widget
    final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final uiImage = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await uiImage.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    // 3️⃣ Target directory
    final downloadsDir = Directory('/storage/emulated/0/Download');
    if (!downloadsDir.existsSync()) downloadsDir.createSync(recursive: true);

    // 4️⃣ Standard filename
    final now = DateTime.now();
    final fileName = 'dp_maker_${DateFormat("yyMMdd_HHmmss").format(now)}.jpg';
    final filePath = '${downloadsDir.path}/$fileName';

    // 5️⃣ Write file
    final file = File(filePath);
    await file.writeAsBytes(pngBytes);

    // 6️⃣ Refresh gallery
    await refreshGallery(file.path);

    // 7️⃣ Toast
    Fluttertoast.showToast(msg: 'DP Saved to Downloads/$fileName');
    // print('✅ Image saved to: $filePath');
  } catch (e) {
    Fluttertoast.showToast(msg: '❌ Failed to save DP');
    // print('Error saving image: $e');
  }
}

Future<bool> _requestStoragePermission() async {
  if (Platform.isAndroid) {
    // Android 13+ (Tiramisu)
    if (await Permission.photos.isGranted) return true;
    if (await Permission.photos.request().isGranted) return true;

    // Android 11–12
    if (await Permission.manageExternalStorage.isGranted) return true;
    if (await Permission.manageExternalStorage.request().isGranted) return true;

    // Android 10 and below
    if (await Permission.storage.isGranted) return true;
    if (await Permission.storage.request().isGranted) return true;

    Fluttertoast.showToast(msg: 'Storage permission denied ❌');
    return false;
  }
  return true;
}

Future<void> refreshGallery(String filePath) async {
  try {
    const channel = MethodChannel('media_scanner');
    await channel.invokeMethod('scanFile', {'path': filePath});
  } catch (e) {
    // print('⚠️ Media scan failed: $e');
  }
}





void showPreviewDialog(
  BuildContext context,
  String imagePath, {
  File? imageFile,
}) {
  Get.dialog(
    barrierDismissible: false,
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      backgroundColor: MyColors.background,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RepaintBoundary(
              key: _dpKey,
              // ✅ DP Frame UI
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 390),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // ✅ Pass optional picked image to CustomUserDP
                    child: CustomUserDP(
                      imageFile: imageFile,
                      imageUrl: MyImages.logo,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            textHeading24(
              'New DP Is Ready',
              color: MyColors.primary,
              alignC: true,
            ),
            infoText('Download or share your new DP easily.', alignC: true),

            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // ✅ Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomIcon(Icons.arrow_back, 'Back', () => Get.back()),
                _bottomIcon(Icons.download, 'Download DP', () async {
                  Get.back();
                  showLoadingPopup();
                  await _downloadDP(_dpKey);
                  // apply here
                }),
              ],
            ),
            gapBox(10),
          ],
        ),
      ),
    ),
  );
}

Widget _bottomIcon(IconData icon, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Icon(icon, color: MyColors.primary),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: MyColors.textLight)),
      ],
    ),
  );
}
