import 'package:get/get.dart';
import 'movies_tetails_controller.dart';

class MoviesTetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MoviesTetailsController(moviesService: Get.find()));
  }
}
