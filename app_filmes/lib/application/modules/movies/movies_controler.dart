
import 'package:app_filmes/application/ui/menssages/menssagens_mixin.dart';
import 'package:app_filmes/models/genres_model.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:app_filmes/services/genres/genres_service.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesControler extends GetxController with MenssagensMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();
  final enres = <GenresModel>[].obs;

  final popularMovies = <MoviesModel>[].obs;
  final topRatedMoviess = <MoviesModel>[].obs;

  var _popularMoviesOriginal = <MoviesModel>[];
  var _topRatedrMoviesOriginal = <MoviesModel>[];

  final genreSelected = Rxn<GenresModel>();

  MoviesControler(
      {required GenresService genresService,
      required MoviesService moviesService})
      : _genresService = genresService,
        _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    menssagenListiner(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      enres.assignAll(genres);

      final popularMoviesData = await _moviesService.getPopularMovies();
      _popularMoviesOriginal = popularMoviesData;
      final topRatedMoviesData = await _moviesService.getTopRatedMovies();
      _topRatedrMoviesOriginal = topRatedMoviesData;

      popularMovies.assignAll(popularMoviesData);
      topRatedMoviess.assignAll(topRatedMoviesData);
    } catch (e) {
      _message(
        MessageModel.error(
            title: "Erro", message: "Erro Ao Carregar Dados da Pagina"),
      );
    }
  }

  void filteByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((movies) {
        return movies.title.toLowerCase().contains(title.toLowerCase());
      });
      var newTopRatedrMovies = _topRatedrMoviesOriginal.where((movies) {
        return movies.title.toLowerCase().contains(title.toLowerCase());
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMoviess.assignAll(newTopRatedrMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMoviess.assignAll(_topRatedrMoviesOriginal);
    }
  }

  void filterMoviesByGenres(GenresModel? genresModel) {
    var genreFilter = genresModel;
    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }
    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movies) {
        return movies.genres.contains(genreFilter?.id);
      });
      var newTopRatedrMovies = _topRatedrMoviesOriginal.where((movies) {
        return movies.genres.contains(genreFilter?.id);
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMoviess.assignAll(newTopRatedrMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMoviess.assignAll(_topRatedrMoviesOriginal);
    }
  }
}
