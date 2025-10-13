import 'package:dp_maker/config/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomUserDP extends StatelessWidget {
  final double radius;
  // final ImageProvider image;
  final String imageUrl;

  const CustomUserDP({
    super.key,
    // required this.image,
    required this.imageUrl,
    this.radius = 75, // Default size
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade200,
        // backgroundImage: image ?? Image.asset(imageUrl).image,
        backgroundImage: Image.asset(imageUrl).image,
        onBackgroundImageError: (_, __) {},
      ),
    );
  }
}

class DpPlaceHolder extends StatelessWidget {
  const DpPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(radius: 70, backgroundColor: MyColors.accent),
    );
  }
}
