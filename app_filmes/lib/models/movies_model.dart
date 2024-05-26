import 'dart:convert';

class MoviesModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite;
  MoviesModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
    required this.favorite,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'genre_ids': genres,
      'favorite': favorite,
    };
  }

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      releaseDate: map['release_date'] ?? '',
      posterPath: map['poster_path'] ?? '',
      genres: List<int>.from(map['genre_ids'] ?? const []),
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesModel.fromJson(String source) => MoviesModel.fromMap(json.decode(source));

  MoviesModel copyWith({
    int? id,
    String? title,
    String? releaseDate,
    String? posterPath,
    List<int>? genres,
    bool? favorite,
  }) {
    return MoviesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      releaseDate: releaseDate ?? this.releaseDate,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      favorite: favorite ?? this.favorite,
    );
  }
}
