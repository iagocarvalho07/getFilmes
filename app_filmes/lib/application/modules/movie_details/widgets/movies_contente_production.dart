import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';

class MoviesContenteProduction extends StatelessWidget {
  final MoviesDetailsModel? movie;

  const MoviesContenteProduction({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
            text: "Companhia(s) Produtora(s) ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0XFF222222),
            ),
            children: [
              TextSpan(
                text: movie?.productionCompanies.join(", ") ?? "",
                style: const  TextStyle(fontWeight: FontWeight.normal),
              )
            ]),
      ),
    );
  }
}
