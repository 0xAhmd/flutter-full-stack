// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaModelAdapter extends TypeAdapter<MangaModel> {
  @override
  final int typeId = 0;

  @override
  MangaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MangaModel(
      id: fields[0] as String,
      name: fields[1] as String,
      image: fields[2] as String,
      author: fields[3] as String,
      price: fields[4] as String,
      rate: fields[5] as String,
      description: fields[6] as String,
      mainChar: fields[7] as String,
      releaseDate: fields[8] as String,
    )..localImagePath = fields[9] as String?;
  }

  @override
  void write(BinaryWriter writer, MangaModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.rate)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.mainChar)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.localImagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
