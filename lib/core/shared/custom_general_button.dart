import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({
    super.key,
    required this.onPressed,
    required this.name,
    this.minWidth = double.infinity,
  });

  final VoidCallback? onPressed;
  final String name;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: minWidth,
      color: AppColors.accent,
      textColor: AppColors.iconColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
