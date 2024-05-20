import 'package:app_filmes/application/modules/Module.dart';
import 'package:app_filmes/application/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/",
      page: () => const SplashPage(),
    ),
  ];
}
