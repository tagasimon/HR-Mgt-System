// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmployeeModel {
  final String id;
  final String surname;
  final String otherNames;
  final Object dob;
  final String? idPhoto;
  EmployeeModel({
    required this.id,
    required this.surname,
    required this.otherNames,
    required this.dob,
    this.idPhoto,
  });

  EmployeeModel copyWith({
    String? id,
    String? surname,
    String? otherNames,
    Object? dob,
    String? idPhoto,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      surname: surname ?? this.surname,
      otherNames: otherNames ?? this.otherNames,
      dob: dob ?? this.dob,
      idPhoto: idPhoto ?? this.idPhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'surname': surname,
      'otherNames': otherNames,
      'dob': dob,
      'idPhoto': idPhoto,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] as String,
      surname: map['surname'] as String,
      otherNames: map['otherNames'] as String,
      dob: map['dob'] as Object,
      idPhoto: map['idPhoto'] != null ? map['idPhoto'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, surname: $surname, otherNames: $otherNames, dob: $dob, idPhoto: $idPhoto)';
  }

  @override
  bool operator ==(covariant EmployeeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.surname == surname &&
        other.otherNames == otherNames &&
        other.dob == dob &&
        other.idPhoto == idPhoto;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        surname.hashCode ^
        otherNames.hashCode ^
        dob.hashCode ^
        idPhoto.hashCode;
  }
}
