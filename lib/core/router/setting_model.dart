class SettingModel {
  const SettingModel({required this.offline, required this.messOffline, required this.active});

  // All properties should be `final` on our class.
  final bool offline;
  final String messOffline;
  final bool active;

  // Since Todo is immutable, we implement a method that allows cloning the
  // Todo with slightly different content.
SettingModel copyWith({bool? offline, String? messOffline, bool? active}) {
    return SettingModel(
      offline: offline ?? this.offline,
      messOffline: messOffline ?? this.messOffline,
      active: active ?? this.active,
    );
  }
}