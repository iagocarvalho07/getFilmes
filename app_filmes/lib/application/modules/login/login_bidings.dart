import 'package:app_filmes/application/modules/login/login_controler.dart';
import 'package:get/get.dart';

class LoginBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginControler(loginService: Get.find()),
    );
  }
}
