import 'dart:io';
import 'package:dp_maker/controllers/download_controller.dart';
import 'package:dp_maker/controllers/share_controller.dart';
import 'package:dp_maker/widgets/custom_loading.dart';
import 'package:dp_maker/widgets/dp_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config_io.dart';

final GlobalKey _dpKey = GlobalKey();
final dpController = Get.put(DPController());
// final shareController = Get.put(ShareController());

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
              child: DpFrame(
                backgroundImage: imagePath,
                imageFile: imageFile,
                showDp: true, // always show in preview
                borderRadius: 0, // specific to preview
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
                  await dpController.downloadDP(customKey: _dpKey);
                }),
                _bottomIcon(Icons.share, 'Share', () async {
                  Get.back();
                  showLoadingPopup();
                  // await shareController.shareDP(customKey: _dpKey);
                  Get.back(); // close loading
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
