import 'note_model.dart';

class AddNewNoteArg {
  final bool isUpdate;
  final NoteModel? note;

  AddNewNoteArg({required this.isUpdate, this.note});
}
