import 'package:dp_maker/widgets/custom_user_dp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config_io.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:share_plus/share_plus.dart';

// final ScreenshotController _screenshotController = ScreenshotController();

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
            // ✅ Capture only this preview area
            // Screenshot(
            // controller: _screenshotController,
            // child:
                          ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 390),
                child: AspectRatio(
                  aspectRatio: 1, // always square
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: CustomUserDP(imageUrl: MyImages.logo),
                  ),
                ),
              ),

            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 390),
            //   child: AspectRatio(
            //     aspectRatio: 1,
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(8),
            //       child: Image.asset(imagePath, fit: BoxFit.contain),
            //     ),
            //   ),
            // ),
            // ),
            gapBox(16),
            textHeading24(
              'New DP Is Ready',
              color: MyColors.primary,
              alignC: true,
            ),
            infoText('Download New DP to use on your profiles.', alignC: true),

            gapBox(10),
            Divider(),
            gapBox(10),
            // Bottom 3 options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomIcon(Icons.arrow_back, 'Back', () => Get.back()),
                _bottomIcon(Icons.download, 'Download DP', () async {
                  // await _captureAndSave();
                }),
                _bottomIcon(Icons.share, 'Share', () async {
                  // await _captureAndShare();
                }),
              ],
            ),
            gapBox(4),
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
          // ignore: deprecated_member_use
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

// Future<void> _captureAndSave() async {
  // try {
    // final Uint8List? image = await _screenshotController.capture();
    // if (image == null) return;
// 
    // final directory = await getApplicationDocumentsDirectory();
    // final file = File('${directory.path}/dp_preview_${DateTime.now().millisecondsSinceEpoch}.png');
    // await file.writeAsBytes(image);
// 
    // Get.snackbar(
      // 'Saved Successfully',
      // 'DP saved to ${directory.path}',
      // snackPosition: SnackPosition.BOTTOM,
      // backgroundColor: MyColors.primary,
      // colorText: Colors.white,
    // );
  // } catch (e) {
    // Get.snackbar('Error', 'Failed to save image: $e',
        // snackPosition: SnackPosition.BOTTOM,
        // backgroundColor: Colors.redAccent,
        // colorText: Colors.white);
  // }
// }
// 
// Future<void> _captureAndShare() async {
  // try {
    // final Uint8List? image = await _screenshotController.capture();
    // if (image == null) return;
// 
    // final directory = await getTemporaryDirectory();
    // final file = File('${directory.path}/share_dp.png');
    // await file.writeAsBytes(image);
// 
    // const message = '🎉 My new DP created using DP Maker App! Download now.';
    // ignore: deprecated_member_use
    // await Share.shareXFiles([XFile(file.path)], text: message);
  // } catch (e) {
    // Get.snackbar('Error', 'Failed to share: $e',
        // snackPosition: SnackPosition.BOTTOM,
        // backgroundColor: Colors.redAccent,
        // colorText: Colors.white);
  // }
// }
// 