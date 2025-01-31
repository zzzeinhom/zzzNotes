import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:zzznotes/models/note_model.dart';
import 'package:zzznotes/views/widgets/note_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  CategoryType _selectedCategory = CategoryType.personal;

  final Map<CategoryType, Map<String, dynamic>> categoryData = {
    CategoryType.personal: {
      'name': 'personal',
      'color': Color(0xFF4A90E2),
      'icon': Icons.person_outlined,
    },
    CategoryType.work: {
      'name': 'work',
      'color': Color(0xFFF39C12),
      'icon': Icons.work_outlined,
    },
    CategoryType.school: {
      'name': 'school',
      'color': Color(0xFF27AE60),
      'icon': Icons.school_outlined,
    },
    CategoryType.lifestyle: {
      'name': 'lifestyle',
      'color': Color.fromARGB(255, 172, 18, 243),
      'icon': Icons.color_lens_outlined,
    },
  };

  void _selectCategory(CategoryType type) {
    setState(() {
      _selectedCategory = type;
      _category = categoryData[type]!['name']!;
      _color = categoryData[type]!['color'].value!;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String _title = '';
  String _content = '';
  String _category = 'personal';
  int _color = const Color(0xFF4A90E2).value;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          NoteTextField(
              hintText: "Title",
              hintStyle: Theme.of(context).textTheme.labelLarge,
              style: Theme.of(context).textTheme.titleLarge,
              onSaved: (value) {
                _title = value!;
              }),
          const SizedBox(height: 24),
          NoteTextField(
              hintText: "Content",
              maxLength: 500,
              maxLines: 2,
              hintStyle: Theme.of(context).textTheme.labelSmall,
              style: Theme.of(context).textTheme.titleSmall,
              onSaved: (value) {
                _content = value!;
              }),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryButton(CategoryType.personal),
              CategoryButton(CategoryType.work),
              CategoryButton(CategoryType.school),
              CategoryButton(CategoryType.lifestyle),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                NoteModel note = NoteModel(
                    title: _title,
                    content: _content,
                    category: _category,
                    color: _color);
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.onUserInteraction;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3958F8),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: Size(MediaQuery.of(context).size.width, 48),
            ),
            child: const Text(
              "Add Note",
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget CategoryButton(CategoryType type) {
    final data = categoryData[type]!;
    return IconButton(
      icon: Icon(data['icon']),
      color: _selectedCategory == type
          ? data['color']
          : Theme.of(context).colorScheme.onSecondary,
      iconSize: 32,
      onPressed: () => _selectCategory(type),
    );
  }
}

enum CategoryType { personal, work, school, lifestyle }
