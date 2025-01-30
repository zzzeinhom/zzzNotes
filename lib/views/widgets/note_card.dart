import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text('How to write thanks you note',
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            subtitle: Text('Note Content',
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              iconSize: 30,
              color: Theme.of(context).colorScheme.onSecondary,
              onPressed: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}
