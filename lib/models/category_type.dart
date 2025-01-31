import 'package:flutter/material.dart';

enum CategoryType { personal, work, school, lifestyle }

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
