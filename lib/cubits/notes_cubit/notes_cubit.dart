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
  }
}
