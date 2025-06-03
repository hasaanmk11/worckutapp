import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoFullScreen extends StatelessWidget {
  final String videoUrl;

  const VideoFullScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayerController.convertUrlToId(videoUrl);

    if (videoId == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: Icon(Icons.error, color: Colors.red, size: 50)),
      );
    }

    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,

        mute: false,

        enableJavaScript: true,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: YoutubePlayerScaffold(
        controller: controller,
        builder: (context, player) {
          return Center(child: AspectRatio(aspectRatio: 16 / 9, child: player));
        },
      ),
    );
  }
}
