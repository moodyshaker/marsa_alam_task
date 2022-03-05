import 'package:flutter/material.dart';

class NoteModel {
  int? id;
  String title;
  DateTime date;
  String description;

  NoteModel({
    this.id,
    required this.title,
    required this.date,
    required this.description,
  });

  NoteModel.withId({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) '_id': id,
      'title': title,
      'date': date.toIso8601String(),
      'description': description,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel.withId(
      id: map['_id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      description: map['description'],
    );
  }
}

enum Status { open, close }
