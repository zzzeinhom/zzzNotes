import 'package:flutter/material.dart';
import 'package:zzznotes/views/widgets/note_textfield.dart';
import 'package:zzznotes/views/widgets/notes_app_bar.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          NotesAppBar(
            title: "How to make a note",
            icon: Icons.check_outlined,
          ),
          NoteTextField(
              hintText: "Title",
              style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: NoteTextField(
                maxLength: 500,
                maxLines: MediaQuery.of(context).size.height ~/ 24,
                hintText: "Content",
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    ));
  }
}
