import 'package:flutter/cupertino.dart';
import 'package:movilies/src/services/moviles.dart';

class DescProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  String _currentOptionStoryLine = "";

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get currentOptionStoryLine => _currentOptionStoryLine;

  void getStoryLine(String id) async {
    _isLoading = true;
    _hasError = false;

    final res = await MovieServies.details(id);

    _isLoading = false;

    if (!res.hasError()) {
      _currentOptionStoryLine = res.data!;
      print(res.data);
    } else {
      _hasError = true;
    }

    notifyListeners();
  }
}
