import 'package:flutter/cupertino.dart';
import 'package:movilies/src/models/movie.dart';
import 'package:movilies/src/services/moviles.dart';

import '../models/movies_search.dart';

class SearchProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _hasError = false;

  List<SearchResult> _searchedMovies = [];

  List<SearchResult> get searchedMovies => _searchedMovies;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  void searchMovie(String expression) async {
    _isLoading = true;
    _hasError = false;

    final res = await MovieServies.searchAll(expression);

    _isLoading = false;

    if (!res.hasError()) {
      _searchedMovies = res.data!.results;
    } else {
      _hasError = true;
    }

    notifyListeners();
  }
}
