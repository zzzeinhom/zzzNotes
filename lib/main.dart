import 'package:flutter/material.dart';
import 'package:zzznotes/views/notes_view.dart';
import 'package:zzznotes/themes/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('notes');
  runApp(const ZZZNaotes());
}

class ZZZNaotes extends StatelessWidget {
  const ZZZNaotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      color: Theme.of(context).colorScheme.primary,
      home: NotesView(),
    );
  }
}
