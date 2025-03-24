// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointmentMode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentModeAdapter extends TypeAdapter<AppointmentMode> {
  @override
  final int typeId = 1;

  @override
  AppointmentMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentMode(
      doctorName: fields[0] as String,
      general: fields[1] as String,
      date: fields[2] as String,
      time: fields[3] as String,
      dateTime: fields[4] as DateTime,
      doctorImage: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentMode obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.doctorName)
      ..writeByte(1)
      ..write(obj.general)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.doctorImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
