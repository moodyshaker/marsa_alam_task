import 'package:flutter/material.dart';

class TodoModel {
  int? id;
  String title;
  DateTime date;
  String description;

  TodoModel({
    this.id,
    required this.title,
    required this.date,
    required this.description,
  });

  TodoModel.withId({
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

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel.withId(
      id: map['_id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      description: map['description'],
    );
  }
}

enum Status { open, close }
