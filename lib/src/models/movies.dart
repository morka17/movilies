import 'dart:convert';

import 'movie.dart';




class Movies {
  List<Movie> items;
  final String errorMessage;
  Movies({
    required this.items,
    required this.errorMessage,
  });
  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
      'errorMessage': errorMessage,
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      items: List<Movie>.from(map['items']?.map((x) => Movie.fromMap(x))),
      errorMessage: map['errorMessage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) => Movies.fromMap(json.decode(source));

  @override
  String toString() => 'Movies(items: $items, errorMessage: $errorMessage)';
}
