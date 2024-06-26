import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/repositories/login/login_repositorie.dart';
import 'package:app_filmes/repositories/login/login_repositorie_impl.dart';
import 'package:app_filmes/repositories/movies/movies_repositorie.dart';
import 'package:app_filmes/repositories/movies/movies_repositorie_impl.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:app_filmes/services/login/login_service_impl.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:app_filmes/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    Get.lazyPut<LoginRepositorie>(
      () => LoginRepositorieImpl(),
      fenix: true,
    );
    Get.lazyPut<LoginService>(
      () => LoginServiceImpl(loginRepositorie: Get.find()),
      fenix: true,
    );
    Get.put(AuthService()).init();
    Get.lazyPut<MoviesRepositorie>(
      () => MoviesRepositorieImpl(restClient: Get.find()),
      fenix: true,
    );
    Get.lazyPut<MoviesService>(
      () => MoviesServiceImpl(moviesRepositorie: Get.find()),
      fenix: true,
    );
  }
}
