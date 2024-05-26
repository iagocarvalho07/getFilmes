import 'package:app_filmes/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesCard extends StatelessWidget {
  final MoviesModel movie;
  final VoidCallback favoiteCallBack;
  const MoviesCard(
      {Key? key, required this.movie, required this.favoiteCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/movies/details", arguments: movie.id);
      },
      child: Container(
        padding: const  EdgeInsets.all(8),
        width: 158,
        height: 280,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.releaseDate,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            ),
            Positioned(
              bottom: 70,
              right: -3,
              child: Material(
                elevation: 5,
                shape:  const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    iconSize: 15,
                    onPressed: favoiteCallBack,
                    icon: Icon(
                      Icons.favorite,
                      color: movie.favorite ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
