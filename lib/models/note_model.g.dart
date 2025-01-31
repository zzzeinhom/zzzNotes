// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteNodelAdapter extends TypeAdapter<NoteNodel> {
  @override
  final int typeId = 0;

  @override
  NoteNodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteNodel(
      fields[2] as String,
      fields[4] as int,
      title: fields[0] as String,
      content: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteNodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteNodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
