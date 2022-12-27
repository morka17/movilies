import 'package:flutter/material.dart';
import 'package:movilies/src/providers/youtube.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayScreen extends StatefulWidget {
  const YoutubePlayScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  final String movieId;

  @override
  State<YoutubePlayScreen> createState() => _YoutubePlayScreenState();
}

class _YoutubePlayScreenState extends State<YoutubePlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: context.watch<YoutubeProvider>().isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : context.watch<YoutubeProvider>().hasError
                ? Center(
                    child: OutlinedButton(
                      onPressed: () {
                        context
                            .read<YoutubeProvider>()
                            .getYoutubeInfo(widget.movieId);
                      },
                      child: const Text("Retry"),
                    ),
                  )
                : YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: context.read<YoutubeProvider>().controller(),
                      showVideoProgressIndicator: true,
                    ),
                    builder: (context, player) {
                      return Column(
                        children: [player],
                      );
                    },
                  ),
      ),
    );
  }
}
