import 'package:flutter/material.dart';
import 'package:zzznotes/views/widgets/notes_list.dart';
import 'package:zzznotes/views/widgets/notes_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Column(
        children: [
          NotesAppBar(),
          NotesList(),
        ],
      ),
    );
  }
}
