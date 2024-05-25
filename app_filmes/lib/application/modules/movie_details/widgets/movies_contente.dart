import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';

class MoviesContente extends StatelessWidget {
  final MoviesDetailsModel? movie;

  const MoviesContente({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              movie?.overview ?? "",
              style: const TextStyle(fontSize: 14, height: 1.3),
            ),
          ],
        ),
      ),
    );
  }
}
