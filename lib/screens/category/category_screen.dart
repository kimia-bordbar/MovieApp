import 'package:flutter/material.dart';
import 'package:movie_app/api/webservice_caller.dart';
import 'package:movie_app/custom%20view/category_list_item_view.dart';
import 'package:movie_app/models/category_model.dart';
import 'package:movie_app/screens/category/category_videos_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Future<List<Categorys>> getCategories = WebserivceCaller.getCategoryList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List<Categorys>>(
            future: getCategories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: CategoryListItemView(
                        categorys: snapshot.data![index],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CategoryVideosScreen(
                              categorys: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                    );
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
}
