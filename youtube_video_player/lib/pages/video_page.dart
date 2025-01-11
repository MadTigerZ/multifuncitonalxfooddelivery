import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatelessWidget {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'dQw4w9WgXcQ', // Ganti dengan ID video YouTube Anda.
    flags: YoutubePlayerFlags(autoPlay: false),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Y O U T U B E')),
      body: YoutubePlayer(controller: _controller),
    );
  }
}
