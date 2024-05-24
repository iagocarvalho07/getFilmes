import 'package:app_filmes/models/movies_model.dart';

abstract class MoviesService {
   Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();

}