import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayerFlutter extends StatelessWidget {
  YoutubeVideoPlayerFlutter({super.key});

  // List of videos with titles and URLs
  final List<Map<String, String>> videos = [
    {
      'title': 'ARCANE SEASON 2 COLLECTORS SET // Skin Reveal Trailer - VALORANT',
      'url': 'https://youtu.be/d1yOu8UlmkQ?si=AYXGFrAGpytVLOfF',
      'thumbnail': 'https://img.youtube.com/vi/d1yOu8UlmkQ/0.jpg',
      'views': '1.2M views',
      'uploadData': '1 week ago',
    },
    {
      'title': 'EVENT HORIZON : SINGULARITY REVEAL TRAILER',
      'url': 'https://youtu.be/Kwh4FtFgTCI',
      'thumbnail': 'https://img.youtube.com/vi/Kwh4FtFgTCI/0.jpg',
      'views': '1.2M views',
      'uploadData': '1 week ago',
    },
    {
      'title': 'Champions 2024 Skin Reveal Trailer // VALORANT',
      'url': 'https://youtu.be/VNxvRG0ceUI',
      'thumbnail': 'https://img.youtube.com/vi/VNxvRG0ceUI/0.jpg',
      'views': '1.2M views',
      'uploadData': '1 week ago',
    },
    {
      'title': 'THE DRIVE // 2024 VALORANT Game Changers Championship Hype Film',
      'url': 'https://youtu.be/fa_p-q6npXE',
      'thumbnail': 'https://img.youtube.com/vi/fa_p-q6npXE/0.jpg',
      'views': '1.2M views',
      'uploadData': '1 week ago',
    },
    {
      'title': 'Vyse Official Gameplay Reveal // VALORANT',
      'url': 'https://youtu.be/BEpcN-eE8ms',
      'thumbnail': 'https://img.youtube.com/vi/BEpcN-eE8ms/0.jpg',
      'views': '1.2M views',
      'uploadData': '1 week ago',
    }
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text("YouTube Video List", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final video = videos[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(
                        videoURL: video['url']!,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Thumbnail with border radius
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        video['thumbnail']!,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            video['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                video['views']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                video['uploadDate']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class VideoPlayerPage extends StatefulWidget {
  final String videoURL;
  const VideoPlayerPage({super.key, required this.videoURL});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController playerController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoURL);
    playerController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Play YouTube Video"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          YoutubePlayer(controller: playerController),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
