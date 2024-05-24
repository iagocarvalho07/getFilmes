import 'package:app_filmes/application/modules/movies/movies_controler.dart';
import 'package:app_filmes/application/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesFilter extends GetView<MoviesControler> {
  const MoviesFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () {
            return Row(
              children: controller.enres
                  .map((element) => FilterTag(
                        model: element,
                        onPressed: () {},
                        selected: false,
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
