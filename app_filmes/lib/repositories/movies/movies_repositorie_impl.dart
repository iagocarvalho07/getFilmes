import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/movies_details_model.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:app_filmes/repositories/movies/movies_repositorie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  Future<MoviesDetailsModel?> getMoviesDetails(int id) async {
    final result =
        await _restClient.get<MoviesDetailsModel?>("/movie/$id", query: {
      'api_key': FirebaseRemoteConfig.instance.getString("api_token"),
      'language': 'pt-br',
      'append_to_response': 'images,credits',
      'include_image_language': 'en,pt-br'
    }, decoder: (data) {
      return MoviesDetailsModel.fromMap(data);
    });
    if (result.hasError) {
      print("erro ao buscar detalhes do  filme ${result.statusText}}");
      throw Exception("erro Ao Buscar detalhes do filme");
    }
    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(
      String userId, MoviesModel moviesModel) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection("favoritos")
          .doc(userId)
          .collection("doc");

      if (moviesModel.favorite) {
        favoriteCollection.add(moviesModel.toMap());
      } else {
        var favoritedata = await favoriteCollection
            .where("id", isEqualTo: moviesModel.id)
            .limit(1)
            .get();
        favoritedata.docs.first.reference.delete();
      }
    } catch (e) {
      print("Erro Ao favoritar filme $e");
      rethrow;
    }
  }

    @override
  Future<List<MoviesModel>> getFavoritiesMovies(String userId) async {
    var favoriteMovies = await FirebaseFirestore.instance
          .collection('favoritos')
          .doc(userId)
          .collection('doc')
          .get();

    final listFavorities = <MoviesModel>[];
    for(var movie in favoriteMovies.docs) {
      listFavorities.add(MoviesModel.fromMap(movie.data()));
    }
    return listFavorities;
  
  }
}
