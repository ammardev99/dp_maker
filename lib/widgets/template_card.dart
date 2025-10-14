import 'package:flutter/material.dart';

class TemplateCard extends StatelessWidget {
  final String image;
  final bool isGrid;
  final VoidCallback onTap;

  const TemplateCard({
    super.key,
    required this.image,
    required this.isGrid,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double size = isGrid ? 100 : 360;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
