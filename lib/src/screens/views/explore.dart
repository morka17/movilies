import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movilies/src/components/label.dart';
import 'package:movilies/src/providers/desc.dart';
import 'package:movilies/src/providers/explore.dart';
import 'package:movilies/src/screens/descripton.dart';
import 'package:movilies/src/services/moviles.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});
  static const String title = "Explore";

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: context.watch<ExploreProvider>().isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.red),
            )
          : context.watch<ExploreProvider>().hasError
              ? Container(
                  height: size.height - 90,
                  width: size.width,
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    onPressed: () {
                      context
                          .read<ExploreProvider>()
                          .retrieveMovies(MovieOptions.mostPopularMovies);
                      setState(() {});
                    },
                    child: const Text("retry"),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: Text(
                        context.watch<ExploreProvider>().prevOption.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    for (var movie in context.watch<ExploreProvider>().movies)
                      ExploreCard(movie: movie),
                  ],
                ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  const ExploreCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        context.read<DescProvider>().getStoryLine(movie!.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionScreen(
              movie: movie,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              width: 120,
              height: 120,
              color: Colors.grey,
              child: CachedNetworkImage(
                imageUrl: movie.image,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width - 180,
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    "Year (${movie.year})",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12.4,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size.width - 180,
                    child: Text(
                      movie.crews,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     vertical: 1,
                  //     horizontal: 8,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       for (int i = 0;
                  //           i < int.parse(movie.imDbRating.split(".")[0]);
                  //           i++)
                  //         const Icon(
                  //           Icons.star,
                  //           color: Color.fromARGB(255, 247, 247, 30),
                  //           size: 14,
                  //         ),
                  //       const Icon(
                  //         Icons.star_half,
                  //         color: Color.fromARGB(255, 247, 247, 30),
                  //         size: 14,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.comment,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${movie.imDbRating} Comments",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
