import 'package:flutter/cupertino.dart';
import 'package:movilies/src/components/loading_indicator.dart';
import 'package:movilies/src/models/movie.dart';
import 'package:movilies/src/models/view.dart';
import 'package:movilies/src/screens/views/home.dart';
import 'package:movilies/src/services/moviles.dart';

import '../screens/views/chats.dart';
import '../screens/views/explore.dart';
import '../screens/views/notifications.dart';
import '../screens/views/search.dart';

class HomeProvider extends ChangeNotifier {
  int _currentIndex = 2;

  static List<View> views = [
    View(widget: const HomeView(), title: HomeView.title),
    View(widget: const ExploreView(), title: ExploreView.title),
    View(widget: const SearchView(), title: SearchView.title),
    View(widget: const ChatsView(), title: ChatsView.title),
    View(widget: const NotificationsView(), title: NotificationsView.title),
  ];

  View _view = views[0];

  List<Movie> _topTvsMovies = [];
  List<Movie> _topTopMovies = [];
  bool _isLoading = true;
  bool _hasError = true;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  int get currentIndex => _currentIndex;
  List<Movie> get topTvsMovies => _topTvsMovies;
  List<Movie> get topTopMovies => _topTopMovies;

  View get view => _view;

  set currentIndex(int index) {
    _currentIndex = index;
    _view = views[_currentIndex];
    notifyListeners();
  }

  set view(View v) {
    _view = v;
    notifyListeners();
  }

  Future<void> retrieveMovies(BuildContext context) async {
    if (_topTopMovies.isNotEmpty && _topTvsMovies.isNotEmpty) {
      return;
    }

    _isLoading = true;

    var res = await MovieServies.getMovies(MovieOptions.top250Movies);

    if (!res.hasError()) {
      _topTopMovies = res.data!.items;
      _hasError = false;
    } else {
      _hasError = true;
    }

    res = await MovieServies.getMovies(MovieOptions.top250TVs);

    _isLoading = false;

    if (!res.hasError()) {
      _topTvsMovies = res.data!.items;
      _hasError = false;
    } else {
      _hasError = true;
    }

    // print(_topTopMovies);

    notifyListeners();
  }


  void getMovieShortStory() async {



  }
}
