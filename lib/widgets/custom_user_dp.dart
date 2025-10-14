import 'dart:io';

import 'package:dp_maker/config/utils/my_colors.dart';
import 'package:flutter/material.dart';

// class CustomUserDP extends StatelessWidget {
//   final double radius;
//   // final ImageProvider image;
//   final String imageUrl;

//   const CustomUserDP({
//     super.key,
//     // required this.image,
//     required this.imageUrl,
//     this.radius = 75, // Default size
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CircleAvatar(
//         radius: radius,
//         backgroundColor: Colors.grey.shade200,
//         // backgroundImage: image ?? Image.asset(imageUrl).image,
//         backgroundImage: Image.asset(imageUrl).image,
//         onBackgroundImageError: (_, __) {},
//       ),
//     );
//   }
// }

class DpPlaceHolder extends StatelessWidget {
  const DpPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 70,
        backgroundColor: MyColors.accent,
        child: Icon(Icons.image, color: MyColors.primary),
      ),
    );
  }
}


class CustomUserDP extends StatelessWidget {
  final double radius;
  final File? imageFile; // ✅ this will hold the camera/gallery image
  final String? imageUrl; // optional for network/local asset image

  const CustomUserDP({
    super.key,
    this.radius = 75,
    this.imageFile,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider? backgroundImage;

    // ✅ Priority: File > Network > Asset
    if (imageFile != null) {
      backgroundImage = FileImage(imageFile!);
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.startsWith('http')) {
        backgroundImage = NetworkImage(imageUrl!);
      } else {
        backgroundImage = AssetImage(imageUrl!);
      }
    }

    return Center(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: MyColors.accent,
        backgroundImage: backgroundImage,
        child: backgroundImage == null
            ? Icon(Icons.image, color: MyColors.primary, size: radius * 0.8)
            : null,
      ),
    );
  }
}
