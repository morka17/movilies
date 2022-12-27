import 'dart:convert';

class MoviesSearch {
  final String searchTitle;
  final String expression;
  final List<SearchResult> results;
  MoviesSearch({
    required this.searchTitle,
    required this.expression,
    required this.results,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'searchTitle': searchTitle,
      'expression': expression,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory MoviesSearch.fromMap(Map<String, dynamic> map) {
    return MoviesSearch(
      searchTitle: map['searchTitle'] ?? '',
      expression: map['expression'] ?? '',
      results: List<SearchResult>.from(map['results']?.map((x) => SearchResult.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesSearch.fromJson(String source) => MoviesSearch.fromMap(json.decode(source));

  @override
  String toString() => 'MoviesSearch(searchTitle: $searchTitle, expression: $expression, results: $results)';
}

class SearchResult {
  final String id;
  final String resultType;
  final String image;
  final String title;
  final String description;

  SearchResult({
    required this.id,
    required this.resultType,
    required this.image,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'resultType': resultType,
      'image': image,
      'title': title,
      'description': description,
    };
  }

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    return SearchResult(
      id: map['id'] ?? '',
      resultType: map['resultType'] ?? '',
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResult.fromJson(String source) =>
      SearchResult.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MoviesSearch(id: $id, resultType: $resultType, image: $image, title: $title, description: $description)';
  }
}
