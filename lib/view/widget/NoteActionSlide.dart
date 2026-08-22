import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/core/constant/colors.dart';

class NoteActionSlide extends StatelessWidget {
  const NoteActionSlide({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
    this.color = AppColors.accent,
  });

  final String name;
  final IconData icon;
  final void Function(BuildContext) onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomSlidableAction(
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 14, right: 4, left: 4),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
