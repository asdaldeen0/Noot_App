import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/widget/note_card.dart';

class NoteSearchDelegate extends SearchDelegate {
  final List<NoteModel> notes;

  NoteSearchDelegate({required this.notes});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear_rounded, color: AppColors.textMain),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.textMain,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildFilteredList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildFilteredList();
  }

  Widget _buildFilteredList() {
    final filteredNotes = notes.where((note) {
      final titleMatch = note.title.toLowerCase().contains(query.toLowerCase());
      final contentMatch = note.containt.toLowerCase().contains(
        query.toLowerCase(),
      );
      return titleMatch || contentMatch;
    }).toList();

    if (filteredNotes.isEmpty) {
      return const Center(
        child: Text(
          "لا توجد ملاحظات تطابق بحثك",
          style: TextStyle(color: AppColors.textDate, fontSize: 14),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: NoteCard(note: filteredNotes[index]),
        );
      },
    );
  }
}
