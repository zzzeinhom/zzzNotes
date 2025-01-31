import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteNodel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final DateTime date = DateTime.now();
  @HiveField(4)
  final Color color;

  NoteNodel(
    this.category,
    this.color, {
    required this.title,
    required this.content,
  });
}
