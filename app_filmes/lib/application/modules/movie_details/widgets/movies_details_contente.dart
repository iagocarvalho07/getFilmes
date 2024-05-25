import 'package:app_filmes/application/modules/movie_details/widgets/movies_details_contente_title.dart';
import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';

class MoviesDetailsContente extends StatelessWidget {
  final MoviesDetailsModel? movie;

  const MoviesDetailsContente({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesDetailsContenteTitle(movie: movie),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
