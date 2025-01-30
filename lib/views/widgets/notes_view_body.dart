import 'package:flutter/material.dart';
import 'package:zzznotes/views/widgets/note_card.dart';
import 'package:zzznotes/views/widgets/notes_app_bar.dart';

class NotesVieBody extends StatelessWidget {
  const NotesVieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Column(
        children: const [NotesAppBar(), NoteCard()],
      ),
    );
  }
}
