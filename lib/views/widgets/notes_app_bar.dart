import 'package:flutter/material.dart';

class NotesAppBar extends StatelessWidget {
  const NotesAppBar(
      {super.key,
      this.title = 'Keep Notes',
      this.icon = Icons.person_2_outlined});

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.headlineLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon),
            color: Theme.of(context).colorScheme.onSecondary,
            onPressed: () {},
            iconSize: 32,
          ),
        ),
      ],
    );
  }
}
