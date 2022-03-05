import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marsa_alam_task/model/note_model.dart';
import 'package:provider/provider.dart';
import '../Dilaogs/action_dialog.dart';
import '../Provider/main_provider.dart';
import '../model/add_new_note_arg.dart';
import '../screens/add_new_note.dart';
import 'circle_button.dart';

class ActionPortion extends StatelessWidget {
  final NoteModel note;

  const ActionPortion({required this.note, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainProvider = Provider.of<MainProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleButton(
          onPress: () async {
            showDialog(
                context: context,
                builder: (context) => ActionDialog(
                      content: 'Do you want to delete this todo ?',
                      cancelAction: 'No',
                      onCancelClick: () {
                        Navigator.pop(context);
                      },
                      approveAction: 'Yes',
                      onApproveClick: () async {
                        Navigator.pop(context);
                        await mainProvider.deleteNote(note);
                        Fluttertoast.showToast(msg: 'Note Deleted');
                      },
                    ));
          },
          iconColor: Colors.white,
          iconBackground: Colors.red,
          icon: Icons.delete,
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        CircleButton(
          onPress: () async {
            Navigator.pushNamed(context, AddNewNote.id,
                arguments: AddNewNoteArg(isUpdate: true, note: note));
          },
          iconColor: Colors.white,
          iconBackground: Colors.blueAccent,
          icon: Icons.edit,
        )
      ],
    );
  }
}
