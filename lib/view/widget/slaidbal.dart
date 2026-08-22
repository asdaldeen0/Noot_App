import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/view/widget/NoteActionSlide.dart';

class Slaidbale extends StatelessWidget {
  const Slaidbale({
    super.key,
    required this.child,
    required this.onEdit,
    required this.onDelete,
  });
  final Widget child;
  final void Function(BuildContext) onEdit;
  final void Function(BuildContext) onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
     
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.28,
        children: [
          NoteActionSlide(
            name: "تعديل",
            icon: Icons.edit_note_rounded,
            color: AppColors.accent,
            onPressed: onEdit,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.28,
        children: [
          NoteActionSlide(
            name: "حذف",
            icon: Icons.delete_outline_rounded,
            color: AppColors.error,
            onPressed: onDelete,
          ),
        ],
      ),
      child: child,
    );
  }
}
