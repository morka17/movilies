import 'dart:convert';

class Movie {
  String id;
  String rank;
  String title;
  String fullTitle;
  String year;
  String image;
  String crews;
  String imDbRating;
  String imDbRatingCount;
  Movie({
    required this.id,
    required this.rank,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.crews,
    required this.imDbRating,
    required this.imDbRatingCount,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rank': rank,
      'title': title,
      'fullTitle': fullTitle,
      'year': year,
      'image': image,
      'crews': crews,
      'imDbRating': imDbRating,
      'imDbRatingCount': imDbRatingCount,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? '',
      rank: map['rank'] ?? '',
      title: map['title'] ?? '',
      fullTitle: map['fullTitle'] ?? '',
      year: map['year'] ?? '',
      image: map['image'] ?? '',
      crews: map['crews'] ?? '',
      imDbRating: map['imDbRating'] ?? '',
      imDbRatingCount: map['imDbRatingCount'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(id: $id, rank: $rank, title: $title, fullTitle: $fullTitle, year: $year, image: $image, crews: $crews, imDbRating: $imDbRating, imDbRatingCount: $imDbRatingCount)';
  }
}
