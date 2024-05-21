import 'package:app_filmes/application/modules/splash/splash_controler.dart';
import 'package:get/get.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashControler());
  }

}