import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/notes_cubit/notes_cubit.dart';
import 'package:zzznotes/models/note_model.dart';
import 'package:zzznotes/views/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NoteView(
                    note: note,
                  ))),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  note.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              subtitle: Text(
                note.content,
                style: Theme.of(context).textTheme.labelSmall,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                iconSize: 24,
                color: Theme.of(context).colorScheme.onSecondary,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Delete Note"),
                      content: const Text("Are you sure you want to delete?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel",
                              style: Theme.of(context).textTheme.labelSmall),
                        ),
                        TextButton(
                          onPressed: () {
                            note.delete();
                            BlocProvider.of<NotesCubit>(context).getAllNotes();
                            Navigator.pop(context);
                          },
                          child: Text("Delete",
                              style: Theme.of(context).textTheme.labelSmall),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: Color(note.color),
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
