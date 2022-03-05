import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/todo_model.dart';
import '../storage/storage.dart';

class MainProvider extends ChangeNotifier {
  Storage? _database;
  List<TodoModel>? _notes = [];
  bool? _notesEmpty;

  Future<void> initDatabase() async {
    _database = Storage.instance;
    await _database?.db;
  }

  bool? get notesEmpty => _notesEmpty;

  List<TodoModel>? get notes => _notes;

  Future<void> addNewTodo(TodoModel model) async {
    await _database?.insert(model);
    _notes = await _database?.getAllTodos();
    notifyListeners();
  }

  Future<void> updateTodo(TodoModel model) async {
    await _database?.update(model);
    _notes = await _database?.getAllTodos();
    notifyListeners();
  }

  Future<void> deleteTodo(TodoModel model) async {
    await _database?.delete(model);
    _notes = await _database?.getAllTodos();
    notifyListeners();
  }

  Future<void> getTodos() async {
    _notes = [];
    _notes = await _database?.getAllTodos();
    _notesEmpty = _notes?.isEmpty;
    notifyListeners();
  }

  Future<void> deleteAllTodo() async {
    await _database?.deleteAll();
    _notes = await _database?.getAllTodos();
    notifyListeners();
  }
}
