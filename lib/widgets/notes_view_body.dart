import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/notes_cubit/notes_cubit.dart';
import 'package:zzznotes/widgets/notes_list.dart';
import 'package:zzznotes/widgets/notes_app_bar.dart';
import 'package:zzznotes/widgets/notes_search_bar.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Column(
        children: [
          SizedBox(height: 24),
          NotesAppBar(),
          SizedBox(height: 24),
          NotesSearchBar(),
          SizedBox(height: 24),
          NotesList(),
        ],
      ),
    );
  }
}
