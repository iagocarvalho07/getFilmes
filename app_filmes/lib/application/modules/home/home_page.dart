import 'package:app_filmes/application/modules/favoritos/favoritos_bindings.dart';
import 'package:app_filmes/application/modules/favoritos/favoritos_page.dart';
import 'package:app_filmes/application/modules/home/home_controller.dart';
import 'package:app_filmes/application/modules/movies/moives_bindings.dart';
import 'package:app_filmes/application/modules/movies/movies_pages.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controler = Get.find<HomeController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: controler.goToPage,
          currentIndex: controler.pageIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: context.themeGray,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "filmes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favoritos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: "Sair"),
          ],
        );
      }),
      body: Navigator(
        initialRoute: "/movies",
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPages(),
              binding: MoivesBindings(),
            );
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
                settings: settings,
                page: () => const FavoritosPage(),
                binding: FavoritossBindings());
          }
          return null;
        },
      ),
    );
  }
}
