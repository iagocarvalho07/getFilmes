import 'package:app_filmes/models/genres_model.dart';

abstract class GenresRepositories {
    Future<List<GenresModel>> getGenres();
}