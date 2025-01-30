import 'package:flutter/material.dart';
import 'package:zzznotes/views/widgets/add_note.dart';
import 'package:zzznotes/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => const AddNoteSheet());
        },
        backgroundColor: Color(0xFF3958F8),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          size: 32,
        ), // Ensures the button is perfectly circular
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
