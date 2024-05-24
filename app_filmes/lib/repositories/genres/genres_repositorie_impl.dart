import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/genres_model.dart';
import 'package:app_filmes/repositories/genres/genres_repositories.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class GenresRepositorieImpl implements GenresRepositories {
  final RestClient _restClient;

  GenresRepositorieImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<GenresModel>> getGenres() async {
    final result = await _restClient.get<List<GenresModel>>(
      '/genre/movie/list',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString("api_token"),
        'language': 'pt-br'
      },
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData.map<GenresModel>((g) {
            return GenresModel.fromMap(g);
          }).toList();
        }
        return <GenresModel>[];
      },
    );
    if (result.hasError) {
      print(result.statusText);
      throw Exception("Error ao Buscar Genres");
    }

    return result.body ?? <GenresModel>[];
  }
}
