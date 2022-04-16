import 'package:flutter/material.dart';
import 'package:movie_app/custom%20view/video_title_text_view.dart';
// import 'package:movie_app/theme/theme_sevice.dart';

class SliderCustomView extends StatelessWidget {
  final String imagePath;
  final String title;
  const SliderCustomView(
      {Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(1, 0),
        //   )
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Center(
                child: VideoTitleTextView(
              title: title,
            )),
          ),
        ],
      ),
    );
  }
}
