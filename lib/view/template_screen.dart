import 'dart:io';

import 'package:dp_maker/widgets/custom_loading.dart';
import 'package:dp_maker/widgets/custom_user_dp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config_io.dart';
import '../controllers/image_cropper_controller.dart';
import '../widgets/widget_io.dart';

class TemplateScreen extends StatefulWidget {
  final String image;

  const TemplateScreen({super.key, required this.image});

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  bool showDp = false;
  File? _image;
  final ImageCropperController _controller = ImageCropperController();

  void _pickImage(bool fromCamera) async {
    File? image = await _controller.pickAndCropImage(fromCamera: fromCamera);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.background,
        // app bar
        appBar: AppBar(
          title: textHeading24('Create New DP', color: MyColors.foreground),
          centerTitle: true,
          backgroundColor: MyColors.primary,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MyColors.foreground,
              size: 20,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        // body
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // new dp frame
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 390),
                child: AspectRatio(
                  aspectRatio: 1, // always square
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:
                        showDp == true
                            // ? CustomUserDP(imageUrl: MyImages.logo)
                            ? CustomUserDP(
                              imageUrl: MyImages.logo,
                              imageFile: _image,
                            )
                            : DpPlaceHolder(),
                  ),
                ),
              ),

              gapBox(20),

              // bottomSheet & upload image
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    ImagePickerSheet(
                      onCameraTap: () {
                        Get.back();
                        _pickImage(true);
                        showDp = true;
                      },
                      onGalleryTap: () {
                        setState(() {
                          showDp = true;
                        });
                        Get.back();
                        _pickImage(false);
                        // handle gallery
                      },
                    ),
                  );
                },
                // select profile button
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: MyColors.foreground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      infoText(
                        _image == null
                            ? "Select Your Profile"
                            : showDp == true
                            ? "Camera Image Selected"
                            : "Uploard Your Profile",
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        constraints: const BoxConstraints(),
                        splashRadius: 1,
                        onPressed: () {
                          setState(() {
                            showDp = false;
                          });
                        },
                        icon: Icon(
                          Icons.cancel,
                          color:
                              showDp == true ? MyColors.primary : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              gapBox(40),
              // Generate DP button
              CustomButton(
                label: 'Generate DP',
                onPressed: () async {
                  if (showDp) {
                    await showLoadingPopup();
                    // ignore: use_build_context_synchronously
                    showPreviewDialog(context, widget.image, imageFile: _image);
                    // imageFile: _image
                  } else {
                    Get.snackbar(
                      'Upload Profile',
                      'Please select your profile image',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: MyColors.accent,
                      colorText: MyColors.textDark,
                      margin: const EdgeInsets.all(16),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
