import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/screens/category/category_screen.dart';
import 'package:movie_app/screens/dashboard_screen.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/settings/setting_screen.dart';
import 'package:movie_app/theme/theme_sevice.dart';
import 'package:movie_app/theme/themes.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().dartTheme,
      themeMode: ThemeService().getThemeMode(),
      // home: const DashboardScreen(),
      initialRoute: '/dashboard',
      routes: {
        '/home': (_) => const HomeScreen(),
        '/category': (_) => const CategoryScreen(),
        '/setting': (_) => const SettingScreen(),
        '/dashboard': (_) => const DashboardScreen(),
      },
    );
  }
}
