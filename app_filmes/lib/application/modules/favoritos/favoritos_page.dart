import 'package:app_filmes/application/modules/favoritos/favoritos_controller.dart';
import 'package:app_filmes/application/ui/widgets/movies_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritosPage extends GetView<FavoritosController> {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Favoritos"),
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: controller.movies
                    .map(
                      (element) => MoviesCard(
                        movie: element,
                        favoiteCallBack: () =>
                            controller.removeFavorite(element),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
