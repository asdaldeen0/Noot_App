import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/data/local_data_source.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/screen/add_note_view.dart';
import 'package:note_app/view/widget/custom_floating_action_button.dart';
import 'package:note_app/view/widget/custom_home_app_bar.dart';
import 'package:note_app/view/widget/note_counter_badge.dart';
import 'package:note_app/view/widget/note_search_delegate.dart';
import 'package:note_app/view/widget/notes_list_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final LocalDataSource _localDataSource = LocalDataSource();
  List<NoteModel> data = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await _localDataSource.getNotes();
    setState(() {
      data = notes;
    });
  }

  void addNewNote(String title, String containt) async {
    final newNote = NoteModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      containt: containt,
      date:
          "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}",
      time: "${DateTime.now().hour}:${DateTime.now().minute}",
    );

    await _localDataSource.addNote(newNote);
    _loadNotes();
  }

  void deleteNote(NoteModel note) async {
    await _localDataSource.deleteNote(note.id);
    _loadNotes();
  }

  void updateNote(int index, String newTitle, String newContaint) async {
    final updatedNote = NoteModel(
      id: data[index].id,
      title: newTitle,
      containt: newContaint,
      date: data[index].date,
      time: data[index].time,
    );

    await _localDataSource.updateNote(updatedNote);
    _loadNotes();
  }

  void _openBottomSheet({NoteModel? note, int? index}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddNoteView(
        note: note,
        onPressed: (title, containt) {
          if (note == null) {
            addNewNote(title, containt);
          } else {
            updateNote(index!, title, containt);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomHomeAppBar(
        onSearchPressed: () {
          showSearch(
            context: context,
            delegate: NoteSearchDelegate(notes: data),
          );
        },
      ),
      body: Column(
        children: [
          NoteCounterBadge(count: data.length),
          Expanded(
            child: NotesListBody(
              notes: data,
              onEdit: (note, index) =>
                  _openBottomSheet(note: note, index: index),
              onDelete: deleteNote,
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: _openBottomSheet,
      ),
    );
  }
}
