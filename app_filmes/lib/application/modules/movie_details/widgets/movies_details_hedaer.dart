import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailHeader extends StatelessWidget {
  final MoviesDetailsModel? movie;

  const MovieDetailHeader({this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieData = movie;
    if (movieData != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieData.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];
            return Padding(
                padding: const EdgeInsets.all(2),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: image,
                  fit: BoxFit.cover,
                ));
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
