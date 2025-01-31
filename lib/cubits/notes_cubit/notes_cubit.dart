import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:zzznotes/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  late List<NoteModel> notes;
  getAllNotes() {
    notes = Hive.box('notes').values.toList().cast<NoteModel>();
    emit(NotesLoaded());
  }

  searchNotes(String query) {
    if (query.isEmpty) {
      getAllNotes();
    } else {
      notes = Hive.box('notes')
          .values
          .where((element) =>
              element.title.toLowerCase().contains(query.toLowerCase()) ||
              element.content.toLowerCase().contains(query.toLowerCase()))
          .toList()
          .cast<NoteModel>();
      emit(NotesLoaded());
    }
    emit(NotesLoaded());
  }

  void getNotes() {}
}
