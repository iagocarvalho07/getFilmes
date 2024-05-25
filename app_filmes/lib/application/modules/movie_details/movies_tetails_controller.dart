import 'package:app_filmes/application/ui/menssages/menssagens_mixin.dart';
import 'package:app_filmes/models/movies_details_model.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesTetailsController extends GetxController with MenssagensMixin {
  final MoviesService _moviesService;
  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movies = Rxn<MoviesDetailsModel>();

  MoviesTetailsController({
    required MoviesService moviesService,
  }) : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    menssagenListiner(message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final moviesId = Get.arguments;
      loading(true);
      final moviesDetailData = await _moviesService.getMoviesDetails(moviesId);
      movies.value = moviesDetailData;
      loading(false);
    } catch (e, s) {
      print("oque aconteceui aqui $e");
      print("oque aconteceui aqui 2 $s");
      loading(false);
      message(MessageModel.error(
          title: "Error", message: "Erro ao buscar Detalhes do filme"));
    }
  }
}
