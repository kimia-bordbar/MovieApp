import 'package:flutter/material.dart';
import 'package:movie_app/api/webservice_caller.dart';
import 'package:movie_app/custom%20view/video_detail_widget.dart';
import 'package:movie_app/models/category_model.dart';
import 'package:movie_app/models/video_model.dart';

class CategoryVideosScreen extends StatefulWidget {
  final Category category;

  const CategoryVideosScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryVideosScreen> createState() => _CategoryVideosScreenState();
}

class _CategoryVideosScreenState extends State<CategoryVideosScreen> {
  Future<List<Video>> getVideos = WebserivceCaller.getBestVideos();
  late final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        // backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List<Video>>(
            future: getVideos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  // physics: const PageScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data![index].catId == widget.category.id) {
                      return AspectRatio(
                        aspectRatio: 16/16,
                        child: VideoDetailWidget(
                          link: snapshot.data![index].link,
                          title: snapshot.data![index].title,
                          description: snapshot.data![index].description,
                          view: snapshot.data![index].view,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
