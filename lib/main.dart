import 'package:flutter/material.dart';
import 'package:zzznotes/views/notes_view.dart';
import 'package:zzznotes/themes/themes.dart';


void main() {
  runApp(const ZZZNaotes());
}

class ZZZNaotes extends StatelessWidget {
  const ZZZNaotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: NotesView(),
    );
  }
}
