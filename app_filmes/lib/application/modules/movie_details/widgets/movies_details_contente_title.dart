import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class MovieDetailContentTitle extends StatelessWidget {
  final MoviesDetailsModel? movie;
  const MovieDetailContentTitle({Key? key, required this.movie})
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
            movie?.title ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RatingStars(
            value: (movie?.stars ?? 1) / 2,
            valueLabelVisibility: false,
            starColor: Colors.orange,
            starSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie?.genres.map((e) => e.name).join(', ') ?? '|',
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
