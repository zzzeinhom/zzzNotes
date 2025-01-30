import 'package:flutter/material.dart';
import 'package:zzznotes/views/widgets/notes_app_bar.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Column(
        children: [
          NotesAppBar(
            title: "How to make a note",
            icon: Icons.check_outlined,
          ),
        ],
      ),
    ));
  }
}
