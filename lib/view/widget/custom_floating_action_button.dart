import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AppColors.accent,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      icon: const Icon(
        Icons.add_rounded,
        color: AppColors.iconColor,
        size: 22,
      ),
      label: const Text(
        "ملاحظة جديدة",
        style: TextStyle(
          color: AppColors.iconColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
