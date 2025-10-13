import 'package:flutter/material.dart';
import 'package:dp_maker/config/config_io.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double widthSize;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.widthSize = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize,
      height: 40,
      decoration: BoxDecoration(
        gradient: MyColors.gradientTD,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: buttonLabel(label),
      ),
    );
  }
}
