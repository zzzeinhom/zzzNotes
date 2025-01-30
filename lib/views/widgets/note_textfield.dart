import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({super.key, required this.hintText, required this.style});

  final String hintText;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      style: style,
    );
  }
}
