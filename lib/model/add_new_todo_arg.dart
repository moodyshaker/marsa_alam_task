import 'todo_model.dart';

class AddNewNoteArg {
  final bool isUpdate;
  final TodoModel? note;

  AddNewNoteArg({required this.isUpdate, this.note});
}
