import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key, this.onSearchPressed});

  final VoidCallback? onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.background,
      centerTitle: true,
      titleSpacing: 16,
      leading: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Center(
          child: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.6),
              ),
            ),
            child: const Icon(
              Icons.notes_rounded,
              color: AppColors.accent,
              size: 22,
            ),
          ),
        ),
      ),
      title: const Text(
        "ملاحظاتي",
        style: TextStyle(
          color: AppColors.textMain,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onSearchPressed,
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.border.withValues(alpha: 0.6),
                  ),
                ),
                child: const Icon(
                  Icons.search_rounded,
                  color: AppColors.textMain,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
