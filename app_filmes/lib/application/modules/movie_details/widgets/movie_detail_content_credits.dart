import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContentCredits extends StatelessWidget {
  final MoviesDetailsModel? movie;
  const MovieDetailContentCredits({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Text(
          movie?.overview ?? '',
          style: const TextStyle(
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
