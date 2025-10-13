import 'package:dp_maker/widgets/custom_user_dp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config_io.dart';

final GlobalKey _dpKey = GlobalKey();

void showPreviewDialog(BuildContext context, String imagePath) {
  Get.dialog(
    barrierDismissible: false,
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      backgroundColor: MyColors.background,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // DP Frame UI
            RepaintBoundary(
              key: _dpKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 390),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: CustomUserDP(imageUrl: MyImages.logo),
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
            Divider(),
            const SizedBox(height: 10),

            // Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomIcon(Icons.arrow_back, 'Back', () => Get.back()),
                _bottomIcon(Icons.download, 'Download DP', () {
                  Get.snackbar("coming soon...", "underdevelopment");
                  // Add download backend logic here
                }),
                _bottomIcon(Icons.share, 'Share', () {
                  Get.snackbar("coming soon...", "underdevelopment");

                  // Add share backend logic here
                }),
              ],
            ),
            gapBox(10)
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
        CircleAvatar(
          backgroundColor: MyColors.primary,
          child: Icon(icon, color: MyColors.foreground),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: MyColors.textLight),
        ),
      ],
    ),
  );
}
