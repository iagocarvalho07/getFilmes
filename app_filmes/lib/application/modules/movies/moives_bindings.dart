import 'package:app_filmes/application/modules/movies/movies_controler.dart';
import 'package:app_filmes/repositories/genres/genres_repositorie_impl.dart';
import 'package:app_filmes/repositories/genres/genres_repositories.dart';
import 'package:app_filmes/services/genres/genres_service.dart';
import 'package:app_filmes/services/genres/genres_service_impl.dart';
import 'package:get/get.dart';

class MoivesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepositories>(
        () => GenresRepositorieImpl(restClient: Get.find()));
    Get.lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepositories: Get.find()));
    Get.lazyPut(() =>
        MoviesControler(genresService: Get.find(), moviesService: Get.find()));
  }
}
