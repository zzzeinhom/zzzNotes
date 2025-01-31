import 'package:flutter/material.dart';
import 'package:zzznotes/models/note_model.dart';
import 'package:zzznotes/views/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => NoteView())),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 24),
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
                iconSize: 28,
                color: Theme.of(context).colorScheme.onSecondary,
                onPressed: () {},
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
