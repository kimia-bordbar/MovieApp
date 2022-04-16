import 'package:flutter/material.dart';

import 'package:movie_app/theme/theme_sevice.dart';

class TitleTextView extends StatelessWidget {
  final String title;
  const TitleTextView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black
          // color: Colors.white,
          ),
    );
  }
}
