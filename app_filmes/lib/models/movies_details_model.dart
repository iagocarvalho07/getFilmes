import 'dart:convert';

import 'package:app_filmes/models/cast_model.dart';
import 'package:app_filmes/models/genres_model.dart';

class MoviesDetailsModel {
  final String title;
  final double stars;
  final List<GenresModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;
  MoviesDetailsModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'stars': stars,
      'genres': genres.map((x) => x.toMap()).toList(),
      'urlImages': urlImages,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'productionCompanies': productionCompanies,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MoviesDetailsModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPoster = map['images']['posters'];
    var urlImages = urlImagesPoster
            ?.map<String>((images) =>
                'https://image.tmdb.org/t/p/w200${images['file_path']}')
            .toList() ??
        const [];

    return MoviesDetailsModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0.0,
      genres: List<GenresModel>.from(map['genres']?.map(
            (x) => GenresModel.fromMap(x),
          ) ??
          const []),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies: List<dynamic>.from(
        map['production_companies'] ?? const [],
      ).map<String>((production) => production['name']).toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(
        map['credits']['cast']?.map((x) => CastModel.fromMap(x)) ?? const [],
      ), 
//      spokenLanguages: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesDetailsModel.fromJson(String source) =>
      MoviesDetailsModel.fromMap(json.decode(source));
}
