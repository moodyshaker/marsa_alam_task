import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/todo_model.dart';

class DatePortion extends StatelessWidget {
  final TodoModel note;

  const DatePortion({required this.note, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          DateFormat('dd MMM yy').format(note.date),
          style: const TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          DateFormat('hh mm a').format(note.date),
          style: const TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
