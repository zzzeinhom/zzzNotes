import 'package:flutter/material.dart';
import 'package:zzznotes/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed logic here
        },
        child: Icon(
          Icons.add,
          size: 32,
        ),
        backgroundColor: Color(0xFF3958F8),
        foregroundColor: Colors.white,
        shape: CircleBorder(), // Ensures the button is perfectly circular
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
