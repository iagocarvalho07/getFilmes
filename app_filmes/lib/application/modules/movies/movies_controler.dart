import 'package:app_filmes/application/ui/menssages/menssagens_mixin.dart';
import 'package:app_filmes/models/genres_model.dart';
import 'package:app_filmes/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MoviesControler extends GetxController with MenssagensMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final enres = <GenresModel>[].obs;
  MoviesControler({
    required GenresService genresService,
  }) : _genresService = genresService;

  @override
  void onInit() {
    super.onInit();
    menssagenListiner(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      enres.assignAll(genres);
    } catch (e) {
      _message(
        MessageModel.error(title: "Erro", message: "Erro ao buscar Categorias"),
      );
    }
  }
}
