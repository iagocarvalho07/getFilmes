import 'package:app_filmes/application/modules/Module.dart';
import 'package:app_filmes/application/modules/movie_details/movies_tetails_bindings.dart';
import 'package:app_filmes/application/modules/movie_details/movies_tetails_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MoviesDetailsModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/movies/details",
      page: () => MovieDetailPage(),
      binding: MoviesTetailsBindings(),
    )
  ];
}
