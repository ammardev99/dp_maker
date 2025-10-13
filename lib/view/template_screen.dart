import 'package:dp_maker/widgets/custom_loading.dart';
import 'package:dp_maker/widgets/custom_user_dp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config_io.dart';
import '../widgets/widget_io.dart';

class TemplateScreen extends StatefulWidget {
  final String image;

  const TemplateScreen({super.key, required this.image});

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  bool showDp = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.background,
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 390),
                child: AspectRatio(
                  aspectRatio: 1, // always square
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:
                        showDp == true
                            ? CustomUserDP(imageUrl: MyImages.logo)
                            : gapBox(1),
                  ),
                ),
              ),
              gapBox(20),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    ImagePickerSheet(
                      onCameraTap: () {
                        Get.back();
                        // handle camera
                      },
                      onGalleryTap: () {
                        setState(() {
                          showDp = true;
                        });
                        Get.back();
                        // handle gallery
                      },
                    ),
                  );
                },
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: MyColors.foreground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Your Profile',
                        style: TextStyle(color: MyColors.textDark),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showDp = false;
                          });
                        },
                        icon: Icon(
                          Icons.cancel,
                          color:
                              showDp == true
                                  ? MyColors.primary
                                  : MyColors.border,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              gapBox(40),
              CustomButton(
                label: 'Generate DP',
                onPressed: () async {
                  if (showDp) {
                    await showLoadingPopup();
                    // ignore: use_build_context_synchronously
                    showPreviewDialog(context, MyImages.templates[0]);
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
