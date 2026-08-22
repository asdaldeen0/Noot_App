import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.name,
    this.istitle = true,  this.lenthtext =false,
  });

  final TextEditingController controller;
  final String name;
  final bool istitle;
  final bool lenthtext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: lenthtext ? 30 : null ,
      validator: (value) {
        if (value!.isEmpty) {
          return " لايمكن ترك هذا الحقل فارغاً";
        }
      },
      maxLines: istitle ? 1 : 10,
      controller: controller,
      cursorColor: AppColors.accent,
      style: const TextStyle(color: AppColors.textMain, fontSize: 16),
      decoration: InputDecoration(
        hintText: name,
        hintStyle: const TextStyle(color: AppColors.textDate),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );
  }
}
