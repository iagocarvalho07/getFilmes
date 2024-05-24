import 'package:app_filmes/application/ui/menssages/menssagens_mixin.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';
import '../../ui/loder_mixin.dart';

class LoginControler extends GetxController with LoderMixin, MenssagensMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginControler({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListerner(loading);
    menssagenListiner(message);
  }

  void login() async {
    try {
      loading.value = true;
      await _loginService.login();
      loading.value = false;
      message(
        MessageModel.info(
          title: "Sucesso",
          message: "Login Realizado com sucesso",
        ),
      );
    } catch (e, s) {
      print(e);
      print(s);
      loading.value = false;
      message(
        MessageModel.error(
          title: "Login Error",
          message: "Erro ao realizar Login",
        ),
      );
    }
  }
}
