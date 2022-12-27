import 'package:flutter/material.dart';
import 'package:movilies/src/components/movie_tile.dart';
import 'package:movilies/src/providers/desc.dart';
import 'package:movilies/src/providers/search.dart';
import 'package:movilies/src/screens/descripton.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String title = "Search";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: context.watch<SearchProvider>().isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : context.watch<SearchProvider>().searchedMovies.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    var movie =
                        context.watch<SearchProvider>().searchedMovies[index];
                    return InkWell(
                      onTap: () {
                        print("search $movie");
                        context.read<DescProvider>().getStoryLine(movie.id);
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return SearchedMovieDescriptionScreen(movie: movie);
                        }));
                      },
                      child: SearchMovieTile(movie: movie),
                    );
                  },
                  itemCount:
                      context.watch<SearchProvider>().searchedMovies.length,
                )
              : context.watch<SearchProvider>().hasError
                  ? OutlinedButton(
                      onPressed: () {},
                      child: Text("retry"),
                    )
                  : Center(
                      child: Text("\"No Result\""),
                    ),
    );
  }
}
