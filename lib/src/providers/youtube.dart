import 'package:flutter/cupertino.dart';
import 'package:movilies/src/services/moviles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/movie_video.dart';

class YoutubeProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;

  String _videoId = "";

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  YoutubePlayerController controller() {
    return YoutubePlayerController(
      initialVideoId: _videoId,
      flags: const YoutubePlayerFlags(mute: false, autoPlay: false),
    );
  }

  void getYoutubeInfo(String movieId) async {
    print("movieId $movieId");

    _isLoading = true;
    _hasError = false;

    final result = await MovieServies.youtubeTrailer(movieId);

    _isLoading = false;

    if (!result.hasError()) {
      MovieTrailer data = result.data!;
      print(data);
      _videoId = data.videoId;
    } else {
      _hasError = true;
    }

    print("videoid $_videoId");

    notifyListeners();
  }
}
