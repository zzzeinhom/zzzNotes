import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  String category;
  @HiveField(3)
  final String date = DateFormat('MMM d, y').format(DateTime.now());
  @HiveField(4)
  int color;

  NoteModel({
    required this.title,
    required this.content,
    required this.category,
    required this.color,
  });
}
