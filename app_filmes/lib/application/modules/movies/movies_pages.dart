import 'package:app_filmes/application/modules/movies/widgets/movies_filter.dart';
import 'package:app_filmes/application/modules/movies/widgets/movies_gruop.dart';
import 'package:app_filmes/application/modules/movies/widgets/movies_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPages extends StatelessWidget {
  const MoviesPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: const [
          MoviesHeader(),
          MoviesFilter(),
          MoviesGruop(title: "Mais populares",),
          MoviesGruop(title: "Top Filmes",),
        ],
      ),
    );
  }
}
