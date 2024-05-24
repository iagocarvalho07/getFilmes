import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:app_filmes/repositories/movies/movies_repositorie.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class MoviesRepositorieImpl implements MoviesRepositorie {
  final RestClient _restClient;

  MoviesRepositorieImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MoviesModel>>(
      '/movie/popular',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString("api_token"),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MoviesModel>((v) => MoviesModel.fromMap(v))
              .toList();
        }
        return <MoviesModel>[];
      },
    );
    if (result.hasError) {
      print("erro ao buscar movies ${result.statusText}}");
      throw Exception("erro Ao Buscar Filmes Popular");
    }
    return result.body ?? <MoviesModel>[];
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final result = await _restClient.get<List<MoviesModel>>(
      '/movie/top_rated',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString("api_token"),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MoviesModel>((v) => MoviesModel.fromMap(v))
              .toList();
        }
        return <MoviesModel>[];
      },
    );
    if (result.hasError) {
      print("erro ao buscar movies ${result.statusText}}");
      throw Exception("erro Ao Buscar Filmes Popular");
    }
    return result.body ?? <MoviesModel>[];
  }
}
