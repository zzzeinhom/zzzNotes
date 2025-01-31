import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/notes_cubit/notes_cubit.dart';

class NotesSearchBar extends StatefulWidget {
  const NotesSearchBar({super.key});

  @override
  State<NotesSearchBar> createState() => _NotesSearchBarState();
}

class _NotesSearchBarState extends State<NotesSearchBar> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                BlocProvider.of<NotesCubit>(context).searchNotes(query);
              },
              icon: Icon(
                Icons.search_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 28,
              )),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.bodyLarge,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              onSubmitted: (value) {
                BlocProvider.of<NotesCubit>(context).searchNotes(value);
              },
              decoration: InputDecoration(
                hintText: "Search notes...",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: IconButton(
              icon: Icon(Icons.dark_mode_outlined),
              color: Theme.of(context).colorScheme.onSecondary,
              onPressed: () {},
              iconSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
