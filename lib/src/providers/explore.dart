import 'package:flutter/cupertino.dart';
import 'package:movilies/src/models/movie.dart';
import 'package:movilies/src/services/moviles.dart';

class ExploreProvider extends ChangeNotifier {
  MovieOptions _prevOption = MovieOptions.mostPopularMovies;
  

  List<Movie> _movies = [];

  MovieOptions get prevOption => _prevOption;

  bool _isLoading = true;
  bool _hasError = false;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  List<Movie> get movies => _movies;

  set movies(List<Movie> items) {
    _movies = items;
    notifyListeners();
  }

  Future<void> retrieveMovies(MovieOptions option) async {
    if (movies.isNotEmpty && _prevOption == option) {
      return;
    }

    _prevOption = option;

    _isLoading = true;
    _hasError = false;

    final res = await MovieServies.getMovies(option);

    _isLoading = false;

    if (!res.hasError()) {
      _movies = res.data!.items;
    } else {
      _hasError = true;
    }

    notifyListeners();
  }
}
