import 'package:app_filmes/models/genres_model.dart';

abstract class GenresService {
  Future<List<GenresModel>> getGenres();
}
