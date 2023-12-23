// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SlideAdapter extends TypeAdapter<Slide> {
  @override
  final int typeId = 1;

  @override
  Slide read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Slide(
      label: fields[0] as String,
      command: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Slide obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.command);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SlideAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
