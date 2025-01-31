import 'package:flutter/material.dart';
import 'package:zzznotes/views/widgets/note_textfield.dart';

class AddNoteSheet extends StatefulWidget {
  const AddNoteSheet({super.key});

  @override
  State<AddNoteSheet> createState() => _AddNoteSheetState();
}

class _AddNoteSheetState extends State<AddNoteSheet> {
  CategoryType _selectedCategory = CategoryType.personal;

  void _selectCategory(CategoryType type) {
    setState(() {
      _selectedCategory = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            NoteTextField(
                hintText: "Title",
                style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(
              height: 24,
            ),
            NoteTextField(
                hintText: "Content",
                maxLength: 500,
                maxLines: 2,
                style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.person_outlined,
                    color: _selectedCategory == CategoryType.personal
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () => _selectCategory(CategoryType.personal),
                ),
                IconButton(
                  icon: Icon(
                    Icons.work_outline,
                    color: _selectedCategory == CategoryType.work
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () => _selectCategory(CategoryType.work),
                ),
                IconButton(
                  icon: Icon(
                    Icons.school_outlined,
                    color: _selectedCategory == CategoryType.school
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () => _selectCategory(CategoryType.school),
                ),
                IconButton(
                  icon: Icon(
                    Icons.color_lens_outlined,
                    color: _selectedCategory == CategoryType.lifestyle
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () => _selectCategory(CategoryType.lifestyle),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3958F8),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width, 48),
              ),
              child: Text(
                "Add Note",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum CategoryType { personal, work, school, lifestyle }
