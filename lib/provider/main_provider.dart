import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/note_model.dart';
import '../storage/storage.dart';

class MainProvider extends ChangeNotifier {
  Storage? _database;
  List<NoteModel>? _notes = [];
  bool? _notesEmpty;

  Future<void> initDatabase() async {
    _database = Storage.instance;
    await _database?.db;
  }

  bool? get notesEmpty => _notesEmpty;

  List<NoteModel>? get notes => _notes;

  Future<void> addNewNote(NoteModel model) async {
    await _database?.insert(model);
    _notes = await _database?.getAllNotes();
    notifyListeners();
  }

  Future<void> updateNote(NoteModel model) async {
    await _database?.update(model);
    _notes = await _database?.getAllNotes();
    notifyListeners();
  }

  Future<void> deleteNote(NoteModel model) async {
    await _database?.delete(model);
    _notes = await _database?.getAllNotes();
    notifyListeners();
  }

  Future<void> getAllNotes() async {
    _notes = [];
    _notes = await _database?.getAllNotes();
    _notesEmpty = _notes?.isEmpty;
    notifyListeners();
  }

  Future<void> deleteAllNote() async {
    await _database?.deleteAll();
    _notes = await _database?.getAllNotes();
    notifyListeners();
  }
}
