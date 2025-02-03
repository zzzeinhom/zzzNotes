import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    super.key,
    required this.hintText,
    required this.style,
    this.maxLength = 500,
    this.maxLines,
    this.scrollPhysics,
    this.expands = false,
    this.onSaved,
    this.hintStyle,
    this.initialValue,
    this.onChanged,
  });

  final String hintText;
  final String? initialValue;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int maxLength;
  final int? maxLines;
  final bool expands;
  final ScrollPhysics? scrollPhysics;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      maxLength: maxLength,
      maxLines: maxLines,
      expands: expands,
      scrollPhysics: scrollPhysics,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        counterText: '',
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
