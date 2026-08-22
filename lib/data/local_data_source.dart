import 'dart:convert';
import 'package:note_app/main.dart';
import 'package:note_app/model/note_model.dart';

class LocalDataSource {
  static const String noteKey = 'notes_list';

  Future<List<NoteModel>> getNotes() async {
    final List<String>? jsonList = sharedPreferences?.getStringList(noteKey);

    if (jsonList == null || jsonList.isEmpty) {
      return [];
    }

    return jsonList.map((item) {
      final Map<String, dynamic> map = jsonDecode(item);
      return NoteModel.fromJson(map);
    }).toList();
  }

  Future<bool> addNote(NoteModel newNote) async {
    List<NoteModel> currentNotes = await getNotes();
    currentNotes.add(newNote);
    return await _saveAllNotes(currentNotes);
  }

  Future<bool> deleteNote(String noteId) async {
    List<NoteModel> currentNotes = await getNotes();
    currentNotes.removeWhere((note) => note.id == noteId);
    return await _saveAllNotes(currentNotes);
  }

  Future<bool> updateNote(NoteModel updatedNote) async {
    List<NoteModel> currentNotes = await getNotes();
    int index = currentNotes.indexWhere((note) => note.id == updatedNote.id);

    if (index != -1) {
      currentNotes[index] = updatedNote;
      return await _saveAllNotes(currentNotes);
    }
    return false;
  }

  Future<bool> _saveAllNotes(List<NoteModel> notes) async {
    List<String> stringList = notes.map((note) {
      return jsonEncode(note.toJson());
    }).toList();

    return await sharedPreferences?.setStringList(noteKey, stringList) ?? false;
  }
}
