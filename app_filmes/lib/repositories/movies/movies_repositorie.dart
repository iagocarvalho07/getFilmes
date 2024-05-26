import 'package:app_filmes/models/movies_details_model.dart';
import 'package:app_filmes/models/movies_model.dart';

abstract class MoviesRepositorie {
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MoviesDetailsModel?> getMoviesDetails(int id);
  Future<void> addOrRemoveFavorite(String userId, MoviesModel moviesModel);
   Future<List<MoviesModel>> getFavoritiesMovies(String userId);
}
