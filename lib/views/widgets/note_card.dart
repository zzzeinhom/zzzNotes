import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                'How to write thank you note',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            subtitle: Text(
              'Note Content (vary this text to test dynamic height)',
              style: Theme.of(context).textTheme.titleSmall,
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
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}
