import 'package:app_filmes/application/bindings/aplication_bindings.dart';
import 'package:app_filmes/application/modules/home/home_module.dart';
import 'package:app_filmes/application/modules/login/login_molude.dart';
import 'package:app_filmes/application/modules/movie_details/movies_details_module.dart';
import 'package:app_filmes/application/modules/splash/splash_module.dart';
import 'package:app_filmes/application/ui/uiconfig/filmes_ui_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseRemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesUiConfig.Title,
      initialBinding: AplicationBindings(),
      theme: FilmesUiConfig.Theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginMolude().routers,
        ...HomeModule().routers,
        ...MoviesDetailsModule().routers,
      ],
    );
  }
}
