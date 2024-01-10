import 'dart:convert';

class Notification {
  final String id;
  final Map<String, dynamic> payload;
  Notification({
    required this.id,
    required this.payload,
  });

  Notification copyWith({
    String? id,
    Map<String, dynamic>? payload,
  }) {
    return Notification(
      id: id ?? this.id,
      payload: payload ?? this.payload,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'payload': payload,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'] as String,
      payload:
          Map<String, dynamic>.from((map['payload'] as Map<String, dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source) as Map<String, dynamic>);

  static String get deeplinkDefinedKey => "deeplink_path";
}
