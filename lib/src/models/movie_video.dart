import 'dart:convert';

class MovieTrailer {
  final String imDbId;
  final String title;
  final String fullTitle;
  final String type;
  final String year;
  final String videoId;
  final String videoUrl;
  final String errorMessage;

  MovieTrailer({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.videoId,
    required this.videoUrl,
    required this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'imDbId': imDbId,
      'title': title,
      'fullTitle': fullTitle,
      'type': type,
      'year': year,
      'videoId': videoId,
      'videoUrl': videoUrl,
      'errorMessage': errorMessage,
    };
  }

  factory MovieTrailer.fromMap(Map<String, dynamic> map) {
    return MovieTrailer(
      imDbId: map['imDbId'] ?? '',
      title: map['title'] ?? '',
      fullTitle: map['fullTitle'] ?? '',
      type: map['type'] ?? '',
      year: map['year'] ?? '',
      videoId: map['videoId'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      errorMessage: map['errorMessage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieTrailer.fromJson(String source) =>
      MovieTrailer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieYTVideo(imDbId: $imDbId, title: $title, fullTitle: $fullTitle, type: $type, year: $year, videoId: $videoId, videoUrl: $videoUrl, errorMessage: $errorMessage)';
  }
}
