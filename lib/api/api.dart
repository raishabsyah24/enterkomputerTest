import 'dart:convert';

import 'package:enterkomputertest/constants.dart';
import 'package:enterkomputertest/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  //api get movie now playing
  static const _nowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';

  //api get movie popular
  static const _popularUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

  //api get favorite movie
  static const _favoriteUrl =
      'https://api.themoviedb.org/3/account/9590627/favorite/movies?session_id=${Constants.seasonId}&api_key=${Constants.apiKey}';

  //api get watchlist movie
  static const _watchListUrl =
      'https://api.themoviedb.org/3/account/9590627/watchlist/movies?session_id=${Constants.seasonId}&api_key=${Constants.apiKey}';

  //api post add to favorite moview
  static const _postfavoriteUrl =
      'https://api.themoviedb.org/3/account/9590627/favorite?session_id=${Constants.seasonId}&api_key=${Constants.apiKey}';

  //api post add to favorite moview
  static const _postwatchlistUrl =
      'https://api.themoviedb.org/3/account/9590627/watchlist?session_id=${Constants.seasonId}&api_key=${Constants.apiKey}';

  //method get dan balikan now playing movie
  Future<List<Movie>> getNowPlayinMovies() async {
    final respone = await http.get(Uri.parse(_nowPlayingUrl));
    if (respone.statusCode == 200) {
      final decodeData = json.decode(respone.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  //method get dan balikan popular movie
  Future<List<Movie>> getPopularMovies() async {
    final respone = await http.get(Uri.parse(_popularUrl));
    if (respone.statusCode == 200) {
      final decodeData = json.decode(respone.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  //method get dan balikan favorite movie
  Future<List<Movie>> getFavoriteMovies() async {
    final respone = await http.get(Uri.parse(_favoriteUrl));
    if (respone.statusCode == 200) {
      final decodeData = json.decode(respone.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  //method get dan balikan watchlist movie
  Future<List<Movie>> getWatchListMovies() async {
    final respone = await http.get(Uri.parse(_watchListUrl));
    if (respone.statusCode == 200) {
      final decodeData = json.decode(respone.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  //method post favorite movie
  Future<List<Movie>> postFavoriteMovies() async {
    final respone = await http.post(Uri.parse(_postfavoriteUrl));
    if (respone.statusCode == 200) {
      final decodeData = json.decode(respone.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  //method post watchlist movie
  Future<List<Movie>> postWatchlistMovies() async {
    final respone = await http.post(Uri.parse(_postwatchlistUrl));
    if (respone.statusCode == 200) {
      final decodeData = json.decode(respone.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
