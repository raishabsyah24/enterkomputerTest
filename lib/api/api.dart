import 'dart:convert';

import 'package:enterkomputertest/constants.dart';
import 'package:enterkomputertest/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _nowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  static const _popularUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

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
}
