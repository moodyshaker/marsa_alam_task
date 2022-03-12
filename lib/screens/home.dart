import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import '../Dilaogs/action_dialog.dart';
import '../Provider/main_provider.dart';
import '../screens/add_new_todo.dart';
import '../widgets/parent_widget.dart';
import '../model/add_new_todo_arg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../widgets/todo_list.dart';
import 'add_new_todo.dart';

class Home extends StatefulWidget {
  static const String id = 'Home_Screen';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late MainProvider _mainProvider;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _mainProvider = Provider.of<MainProvider>(context, listen: false);
    _mainProvider.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return MyParentWidget(
      actions: [
        TextButton(
          onPressed: () async {
            showDialog(
                context: context,
                builder: (context) => ActionDialog(
                      content: 'Do you want to delete all todos ?',
                      cancelAction: 'No',
                      onCancelClick: () {
                        Navigator.pop(context);
                      },
                      approveAction: 'Yes',
                      onApproveClick: () async {
                        Navigator.pop(context);
                        await mainProvider.deleteAllTodo();
                        Fluttertoast.showToast(msg: 'Todos Deleted');
                      },
                    ));
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child: const Text(
            'Delete All',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
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
      bodyWidget: Column(
        children: [
          Wrap(
            spacing: 10.0,
            runSpacing: 4.0,
            children: List.generate(
                10,
                (i) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = i;
                        });
                        log('index $i deleted');
                      },
                      child: Chip(
                        shadowColor: _selectedIndex == i ? Colors.orange.withOpacity(0.3) : Colors.black.withOpacity(0.3),
                        backgroundColor:
                            _selectedIndex == i ? Colors.orange : Colors.grey[100],
                        label: i == 0
                            ? Text(
                                'غير مكتملة',
                                style: TextStyle(
                                    color: _selectedIndex == i
                                        ? Colors.white
                                        : Colors.black),
                              )
                            : i == 1
                                ? Text('في الطريق',
                                    style: TextStyle(
                                        color: _selectedIndex == i
                                            ? Colors.white
                                            : Colors.black))
                                : i == 2
                                    ? Text('في انتظار التوصيل',
                                        style: TextStyle(
                                            color: _selectedIndex == i
                                                ? Colors.white
                                                : Colors.black))
                                    : Text('جديدة',
                                        style: TextStyle(
                                            color: _selectedIndex == i
                                                ? Colors.white
                                                : Colors.black)),
                        avatar: Image.asset(
                          'assets/app_logo.png',
                          width: 10.0,
                          height: 10.0,
                        ),
                      ),
                    )),
          ),
          Expanded(
            child: Consumer<MainProvider>(
                builder: (c, data, ch) => TodoList(todos: data.notes)),
          ),
        ],
      ),
    );
  }
}
