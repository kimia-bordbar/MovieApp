import 'package:flutter/material.dart';
import 'package:movie_app/theme/theme_sevice.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            ThemeService().changeThemeMode();
          },
          child: const Text('Switch Theme')),
    ));
  }
}
