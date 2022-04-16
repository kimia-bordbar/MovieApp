import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/webservice_caller.dart';
import 'package:movie_app/custom%20view/slider_custom_view.dart';
import 'package:movie_app/custom%20view/title_text_view.dart';
import 'package:movie_app/models/video_model.dart';
import 'package:movie_app/screens/home/video_detail_screen.dart';
import 'package:movie_app/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Video>> getNewVideos = WebserivceCaller.getNewVideos();
  Future<List<Video>> getBestVideos = WebserivceCaller.getBestVideos();
  Future<List<Video>> getSpecialVideos = WebserivceCaller.getSpecialVideos();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Best Videos -------------------------------------
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 20.0, bottom: 15.0),
              child: TitleTextView(
                title: Strings.bestVideos,
              ),
            ),
            SizedBox(
              height: 250,
              child: FutureBuilder<List<Video>>(
                  future: getBestVideos,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CarouselSlider.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i, id) {
                          return GestureDetector(
                            child: SliderCustomView(
                              title: snapshot.data![i].title,
                              imagePath: snapshot.data![i].icon,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => VideoDetailScreen(
                                    video: snapshot.data![i],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 250,
                          autoPlay: false,
                          // autoPlayInterval: const Duration(seconds: 4),
                          reverse: false,
                          aspectRatio: 5.0,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Failed to connect!'),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                      );
                    }
                  }),
            ),
            // New Videos -------------------------------------
            const Padding(
              padding: EdgeInsets.only(
                  top: 25.0, left: 15.0, right: 20.0, bottom: 15.0),
              child: TitleTextView(
                title: Strings.newVideos,
              ),
            ),
            SizedBox(
              height: 250,
              child: FutureBuilder<List<Video>>(
                  future: getBestVideos,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CarouselSlider.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i, id) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: GestureDetector(
                              child: SliderCustomView(
                                title: snapshot.data![i].title,
                                imagePath: snapshot.data![i].icon,
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoDetailScreen(
                                        video: snapshot.data![i])));
                              },
                            ),
                          );
                        },
                        options: CarouselOptions(
                          enlargeCenterPage: false,
                          height: 250,
                          autoPlay: false,
                          // autoPlayInterval: const Duration(seconds: 4),
                          reverse: false,
                          aspectRatio: 5.0,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Failed to connect!'),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                      );
                    }
                  }),
            ),
            // Special Videos -------------------------------------
            const Padding(
              padding: EdgeInsets.only(
                  top: 25.0, left: 15.0, right: 20.0, bottom: 15.0),
              child: TitleTextView(
                title: Strings.specialVideos,
              ),
            ),
            SizedBox(
              height: 250,
              child: FutureBuilder<List<Video>>(
                future: getSpecialVideos,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CarouselSlider.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i, id) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: GestureDetector(
                            child: SliderCustomView(
                              title: snapshot.data![i].title,
                              imagePath: snapshot.data![i].icon,
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VideoDetailScreen(
                                      video: snapshot.data![i])));
                            },
                          ),
                        );
                      },
                      options: CarouselOptions(
                        enlargeCenterPage: false,
                        height: 250,
                        autoPlay: false,
                        // autoPlayInterval: const Duration(seconds: 4),
                        reverse: false,
                        aspectRatio: 5.0,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Failed to connect!'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
