import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/theme_cubit/theme_cubit.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      icon: Icon(
          isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
      color: Theme.of(context).colorScheme.onSecondary,
      onPressed: () {
        context.read<ThemeCubit>().toggleTheme(!isDarkMode);
      },
      iconSize: 32,
    );
  }
}
