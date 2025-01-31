import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzznotes/cubits/notes_cubit/notes_cubit.dart';
import 'package:zzznotes/models/category_type.dart';
import 'package:zzznotes/models/note_model.dart';
import 'package:zzznotes/views/widgets/note_textfield.dart';
import 'package:zzznotes/views/widgets/notes_app_bar.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key, required this.note});

  final NoteModel note;

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  late CategoryType _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = CategoryType.values.firstWhere(
      (type) => categoryData[type]!['name'] == widget.note.category,
      orElse: () => CategoryType.personal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24),
            NotesAppBar(
              title: widget.note.title,
              icon: Icons.check_outlined,
              onPressed: () {
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).getAllNotes();
                setState(() {});
              },
              showBackArrow: true,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildCategoryDropdown(),
                ),
                const SizedBox(width: 16),
                Text(
                  widget.note.date,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            const SizedBox(height: 24),
            NoteTextField(
              hintText: "Title",
              initialValue: widget.note.title,
              style: Theme.of(context).textTheme.headlineLarge,
              onChanged: (value) {
                widget.note.title = value!;
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: NoteTextField(
                maxLength: 500,
                maxLines: MediaQuery.of(context).size.height ~/ 24,
                hintText: "Content",
                initialValue: widget.note.content,
                style: Theme.of(context).textTheme.headlineSmall,
                onChanged: (value) {
                  widget.note.content = value!;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: DropdownButton<CategoryType>(
        value: _selectedCategory,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        style: Theme.of(context).textTheme.bodyMedium,
        underline: const SizedBox(),
        onChanged: (CategoryType? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedCategory = newValue;
              widget.note.category = categoryData[newValue]!['name'];
              widget.note.color =
                  (categoryData[newValue]!['color'] as Color).value;
            });
          }
        },
        items: CategoryType.values.map((CategoryType type) {
          final data = categoryData[type]!;
          return DropdownMenuItem<CategoryType>(
            value: type,
            child: Row(
              children: [
                Icon(data['icon'], color: data['color'], size: 24),
                const SizedBox(width: 12),
                Text(
                  data['name'].toString().toUpperCase(),
                  style: TextStyle(
                    color: data['color'],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
