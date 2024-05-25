import 'package:app_filmes/application/modules/movie_details/widgets/movies_contente.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_contente_production.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_details_content_main_cast.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_details_contente.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_details_hedaer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'movies_tetails_controller.dart';

class MoviesTetailsPage extends GetView<MoviesTetailsController> {
  const MoviesTetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoviesDetailsHedaer(
                  movies: controller.movies.value,
                ),
                MoviesDetailsContente(movie: controller.movies.value),
                MoviesContente(movie: controller.movies.value),
                MoviesContenteProduction(movie: controller.movies.value),
                MoviesDetailsContentMainCast(movie: controller.movies.value),

              ],
            );
          },
        ),
      ),
    );
  }
}
