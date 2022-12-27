import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movilies/src/models/movie.dart';

import '../screens/descripton.dart';

class MovieThumbnailCard extends StatelessWidget {
  const MovieThumbnailCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return DescriptionScreen(movie: movie);
        }));
      },
      child: Column(
        children: [
          Card(
            elevation: 5.0,
            child: Container(
              height: 200,
              width: 120,
              color: Colors.grey,
              child: CachedNetworkImage(
                imageUrl: movie.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            alignment: Alignment.center,
            width: 125,
            child: Text(movie.title),
          )
        ],
      ),
    );
  }
}
