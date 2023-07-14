// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdata_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppDataAdapter extends TypeAdapter<AppData> {
  @override
  final int typeId = 0;

  @override
  AppData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppData(
      fields[0] as String,
      fields[1] as bool,
      fields[2] as DarkMode,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.defaultLanguage)
      ..writeByte(1)
      ..write(obj.onboardingLoaded)
      ..writeByte(2)
      ..write(obj.darkMode)
      ..writeByte(3)
      ..write(obj.userLogged)
      ..writeByte(4)
      ..write(obj.appName)
      ..writeByte(5)
      ..write(obj.appPackageName)
      ..writeByte(6)
      ..write(obj.appVersion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DarkModeAdapter extends TypeAdapter<DarkMode> {
  @override
  final int typeId = 1;

  @override
  DarkMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DarkMode.dark;
      case 1:
        return DarkMode.light;
      case 2:
        return DarkMode.system;
      default:
        return DarkMode.dark;
    }
  }

  @override
  void write(BinaryWriter writer, DarkMode obj) {
    switch (obj) {
      case DarkMode.dark:
        writer.writeByte(0);
        break;
      case DarkMode.light:
        writer.writeByte(1);
        break;
      case DarkMode.system:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DarkModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
