import 'package:flutter/material.dart';
import 'package:movie_app/models/video_model.dart';
import 'package:movie_app/custom%20view/video_detail_widget.dart';

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

      body: Column(
        children: [
          Expanded(
            child: VideoDetailWidget(
                  link: widget.video.link,
                  title: widget.video.title,
                  description: widget.video.description,
                  view: widget.video.view,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
