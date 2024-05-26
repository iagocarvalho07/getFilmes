import 'package:app_filmes/models/movies_details_model.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:app_filmes/repositories/movies/movies_repositorie.dart';
import 'package:app_filmes/services/movies/movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepositorie _moviesRepositorie;

  MoviesServiceImpl({
    required MoviesRepositorie moviesRepositorie,
  }) : _moviesRepositorie = moviesRepositorie;

  @override
  Future<List<MoviesModel>> getPopularMovies() =>
      _moviesRepositorie.getPopularMovies();

  @override
  Future<List<MoviesModel>> getTopRatedMovies() =>
      _moviesRepositorie.getTopRatedMovies();

  @override
  Future<MoviesDetailsModel?> getMoviesDetails(int id) =>
      _moviesRepositorie.getMoviesDetails(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, MoviesModel moviesModel) =>
      _moviesRepositorie.addOrRemoveFavorite(userId, moviesModel);

  @override
  Future<List<MoviesModel>> getFavoritiesMovies(String userId) =>
      _moviesRepositorie.getFavoritiesMovies(userId);
}
