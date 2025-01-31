import 'package:flutter/material.dart';

class NotesSearchBar extends StatelessWidget {
  const NotesSearchBar({super.key});

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
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: "Search notes...",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 32,
                ),
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
