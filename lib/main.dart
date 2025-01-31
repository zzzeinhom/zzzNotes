import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:zzznotes/cubits/notes_cubit/notes_cubit.dart';
import 'package:zzznotes/models/note_model.dart';
import 'package:zzznotes/notes_bloc_observer.dart';
import 'package:zzznotes/views/notes_view.dart';
import 'package:zzznotes/themes/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox('notes');

  Bloc.observer = NotesBlocObserver();
  runApp(const ZZZNaotes());
}

class ZZZNaotes extends StatelessWidget {
  const ZZZNaotes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        color: Theme.of(context).colorScheme.primary,
        home: NotesView(),
      ),
    );
  }
}
