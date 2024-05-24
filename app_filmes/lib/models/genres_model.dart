import 'dart:convert';

class GenresModel {
  final int id;
  final String name;

  GenresModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    return GenresModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GenresModel.fromJson(String source) => GenresModel.fromMap(json.decode(source));
}
