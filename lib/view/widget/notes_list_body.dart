import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/widget/note_card.dart';
import 'package:note_app/view/widget/note_slidable.dart';

class NotesListBody extends StatelessWidget {
  final List<NoteModel> notes;
  final void Function(NoteModel note, int index) onEdit;
  final void Function(NoteModel note) onDelete;

  const NotesListBody({
    super.key,
    required this.notes,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Center(
        child: Text(
          "لا توجد ملاحظات بعد، أضف أولى ملاحظاتك",
          style: TextStyle(
            color: AppColors.textDate.withValues(alpha: 0.7),
            fontSize: 14,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final noteItem = notes[index];

        return NoteSlidable(
          key: ValueKey(noteItem.id),
          onEdit: (context) => onEdit(noteItem, index),
          onDelete: (context) => onDelete(noteItem),
          child: NoteCard(note: noteItem),
        );
      },
    );
  }
}
