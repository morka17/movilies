import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movilies/src/providers/youtube.dart';
import 'package:movilies/src/screens/youtube_player_screen.dart';
import 'package:provider/provider.dart';

import 'package:movilies/src/models/movie.dart';
import 'package:movilies/src/models/movies_search.dart';
import 'package:movilies/src/providers/desc.dart';

import '../components/app_button.dart';
import '../components/circular_loading_indicator.dart';

class DescriptionScreen extends StatefulWidget {
  final Movie? movie;

  static const String id = "/desc";
  const DescriptionScreen({super.key, this.movie});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool showmore = false;

  void seemore() {
    setState(() {
      showmore = !showmore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescriptionImageHolder(
                imageURL: widget.movie!.image,
                movieId: widget.movie!.id,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  widget.movie!.fullTitle,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    for (int i = 0;
                        i < int.parse(widget.movie!.imDbRating.split(".")[0]);
                        i++)
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    const Icon(
                      Icons.star_half,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "StoryLine",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: context.watch<DescProvider>().isLoading
                    ? const CircularLoadingIndicator()
                    : context.watch<DescProvider>().hasError
                        ? RetryButton(
                            onPressed: () {},
                          )
                        : RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 16.0),
                              children: [
                                TextSpan(
                                  text: showmore
                                      ? context
                                          .watch<DescProvider>()
                                          .currentOptionStoryLine
                                      : "${context.watch<DescProvider>().currentOptionStoryLine.substring(0, 550)}"
                                          "..",
                                ),
                                TextSpan(
                                  text: "See more",
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => seemore(),
                                ),
                              ],
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchedMovieDescriptionScreen extends StatefulWidget {
  final SearchResult movie;

  static const String id = "/desc";
  const SearchedMovieDescriptionScreen({super.key, required this.movie});

  @override
  State<SearchedMovieDescriptionScreen> createState() =>
      _SearchedMovieDescriptionScreen();
}

class _SearchedMovieDescriptionScreen
    extends State<SearchedMovieDescriptionScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool showmore = false;

  void seemore() {
    setState(() {
      showmore = !showmore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescriptionImageHolder(
                imageURL: widget.movie.image,
                movieId: widget.movie.id,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  widget.movie.title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "StoryLine",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: context.watch<DescProvider>().isLoading
                    ? const CircularLoadingIndicator()
                    : context.watch<DescProvider>().hasError
                        ? Center(
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const Text("retry"),
                            ),
                          )
                        : RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16.0),
                              children: [
                                TextSpan(
                                  text: showmore
                                      ? context
                                          .watch<DescProvider>()
                                          .currentOptionStoryLine
                                      : "${context.watch<DescProvider>().currentOptionStoryLine.substring(0, 550)}"
                                          "..",
                                ),
                                TextSpan(
                                  text: "See more",
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => seemore(),
                                ),
                              ],
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionImageHolder extends StatefulWidget {
  const DescriptionImageHolder({
    Key? key,
    required this.imageURL,
    this.movieId = "",
  }) : super(key: key);

  final String imageURL;
  final String movieId;

  @override
  State<DescriptionImageHolder> createState() => _DescriptionImageHolderState();
}

class _DescriptionImageHolderState extends State<DescriptionImageHolder> {
  bool bookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: CachedNetworkImageProvider(widget.imageURL),
        ),
        color: Colors.red,
      ),
      height: 280,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  bookmarked = !bookmarked;
                  setState(() {});
                },
                icon: Icon(
                  Icons.bookmark_add,
                  color: bookmarked ? Colors.red : Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<YoutubeProvider>().getYoutubeInfo(widget.movieId);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return YoutubePlayScreen(movieId: widget.movieId);
                  }),
                );
              },
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
