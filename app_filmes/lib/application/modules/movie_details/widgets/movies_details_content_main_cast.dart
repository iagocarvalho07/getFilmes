import 'package:app_filmes/application/modules/movie_details/widgets/movie_cast.dart';
import 'package:app_filmes/models/movies_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MoviesDetailsModel? movie;
  final showPanil = false.obs;

  MovieDetailContentMainCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
        ),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              showPanil.toggle();
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: false,
                isExpanded: showPanil.value,
                backgroundColor: Colors.white,
                headerBuilder: ((context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elenco',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }),
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie?.cast
                            .map(
                              (cast) => MovieCast(
                                cast: cast,
                              ),
                            )
                            .toList() ??
                        const [],
                  ),
                ),
              ),
            ],
          );
        }
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}