import 'dart:convert';
import 'dart:io';
import 'package:nonton_yuk/model/movie_model.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlKey = "9f4da56931b7f9fe395b8373f2ff3d77";
  final String urlBase = "https://api.themoviedb.org/3/movie";
  final String urlUpcoming = "/upcoming?";
  final String urlLanguage = "&language=en-US";
  final String urlSearch = "https://api.themoviedb.org/3/search/movie?api_key=9f4da56931b7f9fe395b8373f2ff3d77&query=";

  Future<List> findMovies(String title) async {
    final String query = urlSearch + title;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return urlKey.codeUnits;
    }
  }

  Future<List> getUpcoming(String title) async {
    final String query = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return urlKey.codeUnits;
    }
  }
}