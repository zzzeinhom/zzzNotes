import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:zzznotes/models/note_model.dart';
import 'package:zzznotes/views/notes_view.dart';
import 'package:zzznotes/themes/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('notes');
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const ZZZNaotes());
}

class ZZZNaotes extends StatelessWidget {
  const ZZZNaotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
        // BlocProvider(create: (context) => DeleteNoteCubit()),
        // BlocProvider(create: (context) => UpdateNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        color: Theme.of(context).colorScheme.primary,
        home: NotesView(),
      ),
    );
  }
}
