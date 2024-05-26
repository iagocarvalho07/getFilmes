import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/application/ui/menssages/menssagens_mixin.dart';
import 'package:app_filmes/models/genres_model.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:app_filmes/services/genres/genres_service.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesControler extends GetxController with MenssagensMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;
  final _message = Rxn<MessageModel>();
  final enres = <GenresModel>[].obs;

  final popularMovies = <MoviesModel>[].obs;
  final topRatedMoviess = <MoviesModel>[].obs;

  var _popularMoviesOriginal = <MoviesModel>[];
  var _topRatedrMoviesOriginal = <MoviesModel>[];

  final genreSelected = Rxn<GenresModel>();

  MoviesControler(
      {required GenresService genresService,
      required MoviesService moviesService,
      required AuthService authService})
      : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

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
      await getMovies();
    } catch (e) {
      _message(
        MessageModel.error(
            title: "Erro", message: "Erro Ao Carregar Dados da Pagina"),
      );
    }
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRatedMovies();
      final favorites = await getFavorites();

      popularMoviesData = popularMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;
      topRatedMoviess.assignAll(topRatedMoviesData);
      _topRatedrMoviesOriginal = topRatedMoviesData;
    } on Exception catch (e, s) {
      print('Error ao carregar dados da pagina $e, stackTrace: $s');
      _message(MessageModel.error(
          title: 'Erro', message: 'Error ao carregar dados da pagina'));
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
        return movies.genres.contains(
          genreFilter?.id,
        );
      });
      var newTopRatedrMovies = _topRatedrMoviesOriginal.where(
        (movies) {
          return movies.genres.contains(
            genreFilter?.id,
          );
        },
      );
      popularMovies.assignAll(newPopularMovies);
      topRatedMoviess.assignAll(newTopRatedrMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMoviess.assignAll(_topRatedrMoviesOriginal);
    }
  }

  Future<void> favoiteMovies(MoviesModel moviesModel) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = moviesModel.copyWith(favorite: !moviesModel.favorite);
      _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MoviesModel>> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritiesMovies(user.uid);
      return <int, MoviesModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }
    return {};
  }
}
