import 'package:app_filmes/application/modules/movie_details/widgets/movie_cast.dart';
import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesDetailsContentMainCast extends StatelessWidget {
  final MoviesDetailsModel? movie;
  final showPainal = false.obs;

  MoviesDetailsContentMainCast({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.grey),
        ExpansionPanelList(
          children: [
            ExpansionPanel(
                canTapOnHeader: false,
                isExpanded: true,
                backgroundColor: Colors.white,
                headerBuilder: (context, isExpanded) {
                  return const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Elenco",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
                body: Row(
                  children: [
                    MovieCast(
                      cast: movie!.cast[0],
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }
}
