import 'package:flutter/material.dart';
import 'package:movie_app/models/video_model.dart';
import 'package:movie_app/custom%20view/video_detail_widget.dart';
import 'package:video_player/video_player.dart';

class VideoDetailScreen extends StatefulWidget {
  final Video video;
  const VideoDetailScreen({Key? key, required this.video}) : super(key: key);

  @override
  _VideoDetailScreenState createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(widget.video.title),
        centerTitle: true,
        // backgroundColor: Colors.black,
      ),

      body: ListView(
        children: [
          VideoDetailWidget(
            videoPlayerController:
                VideoPlayerController.network(widget.video.link),
                title: widget.video.title,
                description: widget.video.description,
                view: widget.video.view,
          ),
          
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     widget.video.description,
          //     style: const TextStyle(
          //       // color: Colors.white,
          //       fontSize: 18.0,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: 12.0,
          //     right: 12.0,
          //     bottom: 8.0,
          //   ),
          //   child: Text(
          //     'Views: ${widget.video.view}',
          //     style: const TextStyle(
          //       // color: Colors.white,
          //       fontSize: 12.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
