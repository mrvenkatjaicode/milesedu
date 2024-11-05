import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesedu/const/constant.dart';
import 'package:milesedu/youtube/youtube_bloc.dart';
import 'package:milesedu/youtube/youtube_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerScreen extends StatelessWidget {
  final String videoTitle;
  final String videoUrl;
  YouTubePlayerScreen(
      {super.key, required this.videoTitle, required this.videoUrl});

  late YoutubePlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YoutubeScreenBloc(),
      child: BlocConsumer<YoutubeScreenBloc, YoutubeScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is YoutubeScreenInitialState) {
            _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
              flags: const YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            );
          }
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  videoTitle,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: blackColor,
                  image: DecorationImage(
                    image: AssetImage(bgimage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white)),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
