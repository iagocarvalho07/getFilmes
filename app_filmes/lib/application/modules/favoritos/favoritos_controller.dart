import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class FavoritosController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  var movies = <MoviesModel>[].obs;

  FavoritosController({
    required AuthService authService,
    required MoviesService moviesService,
  })  : _authService = authService,
        _moviesService = moviesService;

  @override
  void onReady() async {
    super.onReady();
    getFavorites();
  }

  Future<void> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      var favorios = await _moviesService.getFavoritiesMovies(user.uid);
      movies.assignAll(favorios);
    }
  }

  Future<void> removeFavorite(MoviesModel moviesModel) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
          user.uid, moviesModel.copyWith(favorite: false));
      movies.remove(moviesModel);
    }
  }
}
