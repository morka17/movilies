import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/movie_video.dart';
import '../models/movies.dart';
import '../models/movies_search.dart';
import '../models/result.dart';
import '../secrets/imdb_api_key.dart';

enum MovieOptions {
  top250Movies,
  top250TVs,
  mostPopularMovies,
  mostPopularTVs,
  comingSoon,
  boxOffice,
  boxOfficeAllTime;

  @override
  String toString() => name.replaceFirst(name[0], name[0].toUpperCase());
}

class MovieServies {
  static const String _baseURL = "imdb-api.com";

  /// GET THE MOVIES FOR IMDB
  static Future<Result<Movies, String>> getMovies(MovieOptions option) async {
    String unencodedPath = "/en/API/${option.toString()}/$APIKEY";

    Map<String, String> headers = {
      "accept": "application/json",
      "Content-Type": "application/json",
    };

    Uri uri = Uri.https(_baseURL, unencodedPath);

    try {
      var response = await http.get(uri, headers: headers);

      int statusCode = response.statusCode;

      if (statusCode == 200) {
        return Result(data: Movies.fromJson(response.body));
      }

      return Result(err: "Unkown error occured.");
    } on SocketException catch (e) {
      return Result(err: "Network error");
    } on TimeoutException catch (e) {
      return Result(err: "taking too long much time to response.");
    }
  }

  /// GET THE MOVIE YOUTUBE TRAILER FOR IMDB
  static Future<Result<MovieTrailer, String>> youtubeTrailer(String id) async {
    String unencodedPath = "/API/YouTubeTrailer/$APIKEY/$id";

    Map<String, String> headers = {
      "accept": "application/json",
      "Content-Type": "application/json",
    };

    Uri uri = Uri.https(_baseURL, unencodedPath);

    try {
      var response = await http.get(uri, headers: headers);

      int statusCode = response.statusCode;
      ;

      if (statusCode == 200) {
        return Result(data: MovieTrailer.fromJson(response.body));
      }

      return Result(err: "Unkown error occured.");
    } on SocketException catch (e) {
      return Result(err: "Network error");
    } on TimeoutException catch (e) {
      return Result(err: "taking too long much time to response.");
    }
  }

  //https://imdb-api.com/en/API/Search/k_inyd4pe1/jack

  /// GET THE MOVIE YOUTUBE TRAILER FOR IMDB
  static Future<Result<MoviesSearch, String>> searchAll(
      String expression) async {
    String unencodedPath = "/API/SearchAll/$APIKEY/$expression";

    Map<String, String> headers = {
      "accept": "application/json",
      "Content-Type": "application/json",
    };

    Uri uri = Uri.https(_baseURL, unencodedPath);

    try {
      var response = await http.get(uri, headers: headers);

      int statusCode = response.statusCode;

      if (statusCode == 200) {
        return Result(data: MoviesSearch.fromJson(response.body));
      }

      return Result(err: "Unkown error occured.");
    } on SocketException catch (e) {
      return Result(err: "Network error");
    } on TimeoutException catch (e) {
      return Result(err: "taking too long much time to response.");
    }
  }

  /// GET THE DETAILS FOR Wikipedia TRAILER FOR IMDB
  static Future<Result<String, String>> details(String id) async {
    String unencodedPath = "API/Wikipedia/$APIKEY/$id";

    Map<String, String> headers = {
      "accept": "application/json",
      "Content-Type": "application/json",
    };

    Uri uri = Uri.https(_baseURL, unencodedPath);

    try {
      var response = await http.get(uri, headers: headers);
      var body = json.decode(response.body);

      int statusCode = response.statusCode;

      if (statusCode == 200) {
        var storyLine = body["plotFull"]["plainText"];
        print(storyLine);
        return Result(data: storyLine);
      }

      return Result(err: "Unkown error occured.");
    } on SocketException catch (e) {
      return Result(err: "Network error");
    } on TimeoutException catch (e) {
      return Result(err: "taking too long much time to response.");
    }
  }
}
