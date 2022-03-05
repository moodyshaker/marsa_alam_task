import 'dart:io';
import '../Dilaogs/action_dialog.dart';
import '../Dilaogs/cupertino_action_dialog.dart';
import '../Provider/main_provider.dart';
import '../screens/add_new_note.dart';
import '../widgets/parent_widget.dart';
import '../widgets/todo_item.dart';
import '../model/add_new_note_arg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../widgets/todo_list.dart';
import 'add_new_note.dart';

class Home extends StatefulWidget {
  static const String id = 'Home_Screen';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late MainProvider _mainProvider;

  @override
  void initState() {
    super.initState();
    _mainProvider = Provider.of<MainProvider>(context, listen: false);
    _mainProvider.getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return MyParentWidget(
      popCallback: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => ActionDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                title: 'Exit',
                content: 'Do you want to Exit',
                onApproveClick: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                onCancelClick: () {
                  Navigator.pop(context);
                },
                approveAction: 'Yes',
                cancelAction: 'No'));
        return false;
      },
      onAddIconCallback: () {
        Navigator.pushNamed(context, AddNewNote.id,
            arguments: AddNewNoteArg(isUpdate: false, note: null));
      },
      appbarTitle: 'Home',
      bodyWidget: Consumer<MainProvider>(
          builder: (c, data, ch) => TodoList(notes: data.notes)),
    );
  }
}
