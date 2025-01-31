import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String date = DateTime.now().toString();
  @HiveField(4)
  final int color;

  NoteModel({
    required this.title,
    required this.content,
    required this.category,
    required this.color,
  });
}
