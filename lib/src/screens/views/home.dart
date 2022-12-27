import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movilies/src/components/app_button.dart';
import 'package:movilies/src/components/circular_loading_indicator.dart';
import 'package:movilies/src/models/movie.dart';
import 'package:movilies/src/providers/explore.dart';
import 'package:movilies/src/providers/home.dart';
import 'package:movilies/src/services/moviles.dart';
import 'package:provider/provider.dart';

import '../../components/movie_tile.dart';
import '../../components/thumbnail.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String title = "Movilies";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    loadingMovies();
  }

  void loadingMovies() async {
    await context.read<HomeProvider>().retrieveMovies(context).then((_) async {
      await context
          .read<ExploreProvider>()
          .retrieveMovies(MovieOptions.mostPopularMovies);
    });
  }

  void exploreRecommendedMovies() async {
    context.read<ExploreProvider>().movies =
        context.read<HomeProvider>().topTvsMovies;
    context.read<HomeProvider>().currentIndex = 1;
  }

  void exploreTopMovies() async {
    context.read<ExploreProvider>().movies =
        context.read<HomeProvider>().topTopMovies;
    context.read<HomeProvider>().currentIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: context.watch<HomeProvider>().isLoading
          ? const CircularLoadingIndicator()
          : context.watch<HomeProvider>().hasError
              ? Container(
                  height: size.height - 90,
                  width: size.width,
                  alignment: Alignment.center,
                  child: RetryButton(
                    onPressed: () {
                      loadingMovies();
                      setState(() {});
                    },
                  ))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Recommended",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black54),
                                text: "View All",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {exploreRecommendedMovies()}),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (var movie in context
                                .watch<HomeProvider>()
                                .topTvsMovies
                                .take(10))
                              MovieThumbnailCard(movie: movie),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Top Movies",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black54),
                              text: "View All",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {exploreTopMovies()},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      for (Movie movie
                          in context.watch<HomeProvider>().topTopMovies.take(6))
                        MovieTile(
                          movie: movie,
                        ),
                    ],
                  ),
                ),
    );
  }
}
