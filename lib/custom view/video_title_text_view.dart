import 'package:flutter/material.dart';
// import 'package:movie_app/theme/theme_sevice.dart';

class VideoTitleTextView extends StatelessWidget {
  final String title;

  const VideoTitleTextView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:const TextStyle(
          fontSize: 18.0,
          fontStyle: FontStyle.italic,
          color: 
          // ThemeService().isSavedDarkMode()
          //     ? Colors.white
          //     : Colors.black 
               Colors.black,
          ),
      // Theme.of(context).textTheme.headline1,
    );
  }
}
