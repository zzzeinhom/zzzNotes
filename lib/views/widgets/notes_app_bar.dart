import 'package:flutter/material.dart';

class NotesAppBar extends StatelessWidget {
  const NotesAppBar(
      {super.key, this.title = 'Notes', this.icon = Icons.person_2_outlined});

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
        IconButton(
          icon: Icon(icon),
          color: Theme.of(context).colorScheme.onPrimary,
          onPressed: () {},
          iconSize: 32,
        ),
      ],
    );
  }
}
