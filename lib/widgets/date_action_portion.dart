import 'package:flutter/material.dart';
import 'package:marsa_alam_task/model/todo_model.dart';
import 'package:marsa_alam_task/widgets/actions_portion.dart';
import 'package:marsa_alam_task/widgets/date_portion.dart';

class DateActionPortion extends StatelessWidget {
  final TodoModel note;

  const DateActionPortion({required this.note, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionPortion(note: note),
          DatePortion(note: note),
        ],
      ),
    );
  }
}
