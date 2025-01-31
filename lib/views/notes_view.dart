import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/notes_cubit/notes_cubit.dart';
import 'package:zzznotes/views/widgets/add_note.dart';
import 'package:zzznotes/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => NotesCubit(),
        child: NotesViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              context: context,
              builder: (context) => const AddNoteSheet());
        },
        backgroundColor: Color(0xFF3958F8),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
