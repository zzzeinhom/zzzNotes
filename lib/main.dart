import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/notes_cubit/notes_cubit.dart';
import 'package:zzznotes/cubits/theme_cubit/theme_cubit.dart';
import 'package:zzznotes/models/note_model.dart';
import 'package:zzznotes/observers/notes_bloc_observer.dart';
import 'package:zzznotes/views/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox('notes');

  Bloc.observer = NotesBlocObserver();
  runApp(BlocProvider(
    create: (context) => ThemeCubit()..setInitialTheme(),
    child: ZZZNaotes(),
  ));
}

class ZZZNaotes extends StatelessWidget {
  const ZZZNaotes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => NotesCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            color: Theme.of(context).colorScheme.primary,
            home: NotesView(),
          ),
        );
      },
    );
  }
}
