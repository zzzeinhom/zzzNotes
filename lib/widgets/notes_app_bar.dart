import 'package:flutter/material.dart';

class NotesAppBar extends StatelessWidget {
  const NotesAppBar({
    super.key,
    this.title = 'Keep Notes',
    this.icon = Icons.person_2_outlined,
    this.onPressed,
    this.showBackArrow = false,
  });

  final String title;
  final IconData icon;
  final Function()? onPressed;
  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBackArrow)
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.onSecondary,
            onPressed: () => Navigator.pop(context),
            iconSize: 32,
          ),
        if (showBackArrow) const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: Icon(icon),
          color: Theme.of(context).colorScheme.onSecondary,
          onPressed: onPressed,
          iconSize: 32,
        ),
      ],
    );
  }
}
