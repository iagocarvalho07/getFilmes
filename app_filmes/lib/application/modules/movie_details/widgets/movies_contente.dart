import 'package:app_filmes/application/modules/movie_details/widgets/movie_detail_content_credits.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_contente_production.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_details_content_main_cast.dart';
import 'package:app_filmes/application/modules/movie_details/widgets/movies_details_contente_title.dart';
import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContent extends StatelessWidget {
  final MoviesDetailsModel? movie;

  const MovieDetailContent({ Key? key, required this.movie }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movie: movie),
        MovieDetailContentCredits(movie: movie),
        MovieDetailContentProductionCompanies(movie: movie,),
        MovieDetailContentMainCast(movie: movie)
      ],
    );
  }
}
