import 'package:get/get.dart';
import 'favoritos_controller.dart';

class FavoritossBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoritosController(
        authService: Get.find(), moviesService: Get.find()));
  }
}
