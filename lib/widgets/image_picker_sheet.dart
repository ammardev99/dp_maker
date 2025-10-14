import 'package:dp_maker/config/utils/my_colors.dart';
import 'package:flutter/material.dart';

class ImagePickerSheet extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const ImagePickerSheet({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: MyColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          const Text(
            'Select',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: MyColors.textDark,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOption(Icons.camera_alt, 'Camera', onCameraTap),
              _buildOption(Icons.photo, 'Gallery', onGalleryTap),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOption(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            // ignore: deprecated_member_use
            backgroundColor: MyColors.primary.withOpacity(0.1),
            child: Icon(icon, color: MyColors.primary, size: 28),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: MyColors.textDark)),
        ],
      ),
    );
  }
}
