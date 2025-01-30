import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    super.key,
    required this.hintText,
    required this.style,
    this.maxLength = 200,
    this.maxLines = 1,
  });

  final String hintText;
  final TextStyle? style;
  final int maxLength;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      style: style,
      cursorWidth: 1.5,
      cursorHeight: 20,
      cursorColor: Theme.of(context).colorScheme.onSurface,
    );
  }
}
