import 'package:flutter/material.dart';

class NotesAppBar extends StatelessWidget {
  const NotesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Keep Notes', style: Theme.of(context).textTheme.headlineLarge),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.person_2_outlined),
          color: Theme.of(context).colorScheme.onPrimary,
          onPressed: () {},
          iconSize: 32,
        ),
      ],
    );
  }
}
