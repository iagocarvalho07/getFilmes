import 'package:app_filmes/application/modules/movie_details/movies_tetails_controller.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_contente.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_details_hedaer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends GetView<MoviesTetailsController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(
                movie: controller.movies.value,
              ),
              MovieDetailContent(movie: controller.movies.value)
            ],
          );
        }),
      ),
    );
  }
}
