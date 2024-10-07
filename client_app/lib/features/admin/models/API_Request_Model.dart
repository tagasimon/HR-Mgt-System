// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApiRequestModel {
  final String name;
  final String status;
  final String message;
  final Object date;
  final String method;
  ApiRequestModel({
    required this.name,
    required this.status,
    required this.message,
    required this.date,
    required this.method,
  });

  ApiRequestModel copyWith({
    String? name,
    String? status,
    String? message,
    Object? date,
    String? method,
  }) {
    return ApiRequestModel(
      name: name ?? this.name,
      status: status ?? this.status,
      message: message ?? this.message,
      date: date ?? this.date,
      method: method ?? this.method,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'status': status,
      'message': message,
      'date': date,
      'method': method,
    };
  }

  factory ApiRequestModel.fromMap(Map<String, dynamic> map) {
    return ApiRequestModel(
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      date: map['date'] as Object,
      method: map['method'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiRequestModel.fromJson(String source) =>
      ApiRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiRequestModel(name: $name, status: $status, message: $message, date: $date, method: $method)';
  }

  @override
  bool operator ==(covariant ApiRequestModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.status == status &&
        other.message == message &&
        other.date == date &&
        other.method == method;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        status.hashCode ^
        message.hashCode ^
        date.hashCode ^
        method.hashCode;
  }
}
