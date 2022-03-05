import '../Dilaogs/action_dialog.dart';
import '../Provider/main_provider.dart';
import '../model/add_new_todo_arg.dart';
import '../model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../widgets/input_field.dart';
import '../widgets/material_button.dart';
import '../widgets/parent_widget.dart';

class AddNewNote extends StatefulWidget {
  static const String id = 'Add_New_Note';
  final AddNewNoteArg arg;

  const AddNewNote({
    Key? key,
    required this.arg,
  }) : super(key: key);

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  String? _title, _description, _pictureUrl;
  late TextEditingController _titleController, _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    if (widget.arg.isUpdate) {
      _titleController.text = widget.arg.note!.title;
      _descriptionController.text = widget.arg.note!.description;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainProvider = Provider.of<MainProvider>(context);
    return WillPopScope(
        onWillPop: () async {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => ActionDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              title: 'Cancel',
              content: 'Do you want to cancel',
              onApproveClick: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              onCancelClick: () {
                Navigator.pop(context);
              },
              approveAction: 'Yes',
              cancelAction: 'No',
            ),
          );
          return false;
        },
        child: MyParentWidget(
          onAddIconCallback: null,
          appbarTitle: widget.arg.isUpdate ? 'Edit Note' : 'Add New Note',
          bodyWidget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formState,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyInputField(
                    readOnly: false,
                    isRadiusBorder: true,
                    controller: _titleController,
                    validator: (String? output) =>
                        output!.isEmpty ? 'please enter note title' : null,
                    onSaved: (String? value) => _title = value,
                    labelText: 'title',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  MyInputField(
                    readOnly: false,
                    isRadiusBorder: true,
                    minLines: 5,
                    controller: _descriptionController,
                    validator: (String? output) => output!.isEmpty
                        ? 'please enter note description'
                        : null,
                    onSaved: (String? value) => _description = value,
                    labelText: 'description',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  MyMaterialButton(
                    onPressCallback: () async {
                      if (_formState.currentState!.validate()) {
                        _formState.currentState!.save();
                        if (widget.arg.isUpdate) {
                          await mainProvider.updateTodo(TodoModel(
                            id: widget.arg.note!.id,
                            title: _title!,
                            date: DateTime.now(),
                            description: _description!,
                          ));
                          Fluttertoast.showToast(msg: 'Note Edited');
                        } else {
                          await mainProvider.addNewTodo(TodoModel(
                            title: _title!,
                            date: DateTime.now(),
                            description: _description!,
                          ));
                          Fluttertoast.showToast(msg: 'Note Added');
                        }
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    label: widget.arg.isUpdate ? 'Edit' : 'Save',
                  ),
                ],
              )),
            ),
          ),
        ));
  }
}
