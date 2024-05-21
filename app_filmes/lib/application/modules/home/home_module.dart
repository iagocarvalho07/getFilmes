import 'package:app_filmes/application/modules/Module.dart';
import 'package:app_filmes/application/modules/home/home_bindings.dart';
import 'package:app_filmes/application/modules/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/home",
      page: () =>  HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
