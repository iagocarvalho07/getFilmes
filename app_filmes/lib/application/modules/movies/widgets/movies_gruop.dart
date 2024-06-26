import 'package:app_filmes/application/modules/movies/movies_controler.dart';
import 'package:app_filmes/application/ui/widgets/movies_card.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGruop extends GetView<MoviesControler> {
  final String title;
  final List<MoviesModel> movies;

  const MoviesGruop({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 280,
            child: Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  var movie = movies[index];
                  return MoviesCard(
                    movie: movie,
                    favoiteCallBack: () => controller.favoiteMovies(movie),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
