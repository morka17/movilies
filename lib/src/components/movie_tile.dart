import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movilies/src/components/label.dart';
import 'package:movilies/src/models/movies_search.dart';
import 'package:movilies/src/screens/descripton.dart';

import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return DescriptionScreen(movie: movie);
        }));
      },
      child: Card(
        elevation: 5.0,
        child: Row(
          children: [
            Container(
              height: 170,
              width: 120,
              color: Colors.grey,
              child: CachedNetworkImage(
                imageUrl: movie.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 170,
              width: size.width - 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      " (${movie.year})",
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        for (int i = 0;
                            i < int.parse(movie.imDbRating.split(".")[0]);
                            i++)
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 247, 247, 30),
                            size: 14,
                          ),
                        const Icon(
                          Icons.star_half,
                          color: Color.fromARGB(255, 247, 247, 30),
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(""
                        //   movie.description.length <= 120
                        //       ? movie.description
                        //       : "${movie.description.substring(0, 120)}" "...",
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchMovieTile extends StatelessWidget {
  const SearchMovieTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final SearchResult movie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5.0,
      child: Row(
        children: [
          Container(
            height: 170,
            width: 120,
            color: Colors.grey,
            child: CachedNetworkImage(
              imageUrl: movie.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 170,
            width: size.width - 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    movie.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
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
                //           i < int.parse(movie. .split(".")[0]);
                //           i++)
                //         Icon(
                //           Icons.star,
                //           color: Colors.yellowAccent,
                //           size: 14,
                //         ),
                //       Icon(
                //         Icons.star_half,
                //         color: Colors.yellowAccent,
                //         size: 14,
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  child: Text(""
                      //   movie.description.length <= 120
                      //       ? movie.description
                      //       : "${movie.description.substring(0, 120)}" "...",
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
