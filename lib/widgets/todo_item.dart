import 'package:flutter/material.dart';
import 'package:marsa_alam_task/widgets/title_desc_portion.dart';
import '../model/note_model.dart';
import 'date_action_portion.dart';

class MyTodoItem extends StatelessWidget {
  final NoteModel note;

  const MyTodoItem({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        child: Column(
          children: [
            TitleDescPortion(
              note: note,
            ),
            DateActionPortion(
              note: note,
            )
          ],
        ),
      ),
    );
  }
}
