import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dp_maker/widgets/custom_user_dp.dart';
import '../config/config_io.dart';

class DpFrame extends StatelessWidget {
  final String backgroundImage; // asset or network
  final File? imageFile; // optional user-picked image
  final bool showDp; // optional placeholder control
  final double borderRadius; // customizable border radius

  const DpFrame({
    super.key,
    required this.backgroundImage,
    this.imageFile,
    this.showDp = true,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100, maxWidth: 390),
      child: AspectRatio(
        aspectRatio: 1, // always square
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: showDp
              ? CustomUserDP(
                  imageUrl: MyImages.logo,
                  imageFile: imageFile,
                )
              : DpPlaceHolder(),
        ),
      ),
    );
  }
}
