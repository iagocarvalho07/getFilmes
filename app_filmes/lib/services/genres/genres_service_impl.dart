import 'package:app_filmes/models/genres_model.dart';
import 'package:app_filmes/services/genres/genres_service.dart';

import '../../repositories/genres/genres_repositories.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepositories _genresRepositories;

  GenresServiceImpl({
    required GenresRepositories genresRepositories,
  }) : _genresRepositories = genresRepositories;

  @override
  Future<List<GenresModel>> getGenres() => _genresRepositories.getGenres();
}
