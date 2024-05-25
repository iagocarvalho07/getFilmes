import 'package:app_filmes/application/modules/movie_details/movies_tetails_controller.dart';
import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesDetailsHedaer extends GetView<MoviesTetailsController> {
  final MoviesDetailsModel? movies;

  const MoviesDetailsHedaer({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movies != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies!.urlImages.length,
            itemBuilder: (context, index) {
              final image = movies!.urlImages[index];
              return Padding(
                padding: EdgeInsets.all(2),
                child: Image.network(image),
              );
            }),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
