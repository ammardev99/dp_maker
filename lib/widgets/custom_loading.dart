import 'package:dp_maker/config/config_io.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showLoadingPopup({
  String message = "Loading...",
  Duration duration = const Duration(seconds: 1),
}) async {
  // Show popup dialog
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: MyColors.primary,
              ),
            ),
            gapBox(16),
            Text(message),
          ],
        ),
      ),
    ),
    barrierDismissible: false, // Prevent closing on tap outside
  );

  // Wait for the specified duration
  await Future.delayed(duration);

  // Close the dialog
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
}
