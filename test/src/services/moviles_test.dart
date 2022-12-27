import 'package:flutter_test/flutter_test.dart';
import 'package:movilies/src/services/moviles.dart';

void main() {
  group("Movie services", () {
    test('Get TOP Moviles ...', () async {
      final result = await MovieServies.getMovies(MovieOptions.top250Movies);

      expect(result.err, null);
    });

    test('Get MostPopularMovies Moviles ...', () async {
      final result =
          await MovieServies.getMovies(MovieOptions.mostPopularMovies);

      expect(result.err, null);
    });

    test('Get ComingSoon Moviles ...', () async {
      final result = await MovieServies.getMovies(MovieOptions.comingSoon);

      expect(result.err, null);
    });

    test('Get BoxOffice Moviles ...', () async {
      final result = await MovieServies.getMovies(MovieOptions.boxOffice);

      expect(result.err, null);
    });

    test('Get boxOfficeAllTime Moviles ...', () async {
      final result =
          await MovieServies.getMovies(MovieOptions.boxOfficeAllTime);

      expect(result.err, null);
    });

    test('Get MostPopularTVs Moviles ...', () async {
      final result = await MovieServies.getMovies(MovieOptions.mostPopularTVs);

      expect(result.err, null);
    });

    test('Get Top250TVs Moviles ...', () async {
      final result = await MovieServies.getMovies(MovieOptions.top250TVs);

      expect(result.err, null);
    });
  });
}
