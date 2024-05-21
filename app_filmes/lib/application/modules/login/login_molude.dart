import 'package:app_filmes/application/modules/Module.dart';
import 'package:app_filmes/application/modules/login/login_bidings.dart';
import 'package:app_filmes/application/modules/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoginMolude implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/login",
      page: () =>  LoginPage(),
      binding: LoginBidings(),
    ),
  ];
}
