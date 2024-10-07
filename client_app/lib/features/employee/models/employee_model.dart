// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class EmployeeModel {
  final String employee_number;
  final String? surname;
  final String? other_names;
  final Object? date_of_birth;
  final String? id_photo;
  final String unique_code;
  EmployeeModel({
    required this.employee_number,
    this.surname,
    this.other_names,
    this.date_of_birth,
    this.id_photo,
    this.unique_code = '1234567890',
  });

  EmployeeModel copyWith({
    String? employee_number,
    String? surname,
    String? other_names,
    Object? date_of_birth,
    String? id_photo,
    String? unique_code,
  }) {
    return EmployeeModel(
      employee_number: employee_number ?? this.employee_number,
      surname: surname ?? this.surname,
      other_names: other_names ?? this.other_names,
      date_of_birth: date_of_birth ?? this.date_of_birth,
      id_photo: id_photo ?? this.id_photo,
      unique_code: unique_code ?? this.unique_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employee_number': employee_number,
      'surname': surname,
      'other_names': other_names,
      'date_of_birth': date_of_birth,
      'id_photo': id_photo,
      'unique_code': unique_code,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      employee_number: map['employee_number'] as String,
      surname: map['surname'] != null ? map['surname'] as String : null,
      other_names:
          map['other_names'] != null ? map['other_names'] as String : null,
      date_of_birth: map['date_of_birth'] as Object,
      id_photo: map['id_photo'] != null ? map['id_photo'] as String : null,
      unique_code: map['unique_code'] as String? ?? '1234567890',
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeModel(employee_number: $employee_number, surname: $surname, other_names: $other_names, date_of_birth: $date_of_birth, id_photo: $id_photo, unique_code: $unique_code)';
  }

  @override
  bool operator ==(covariant EmployeeModel other) {
    if (identical(this, other)) return true;

    return other.employee_number == employee_number &&
        other.surname == surname &&
        other.other_names == other_names &&
        other.date_of_birth == date_of_birth &&
        other.id_photo == id_photo &&
        other.unique_code == unique_code;
  }

  @override
  int get hashCode {
    return employee_number.hashCode ^
        surname.hashCode ^
        other_names.hashCode ^
        date_of_birth.hashCode ^
        id_photo.hashCode ^
        unique_code.hashCode;
  }
}
