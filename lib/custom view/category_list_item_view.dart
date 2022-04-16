import 'package:flutter/material.dart';
import 'package:movie_app/models/category_model.dart';

class CategoryListItemView extends StatefulWidget {
  final Categorys categorys;
  const CategoryListItemView({Key? key, required this.categorys})
      : super(key: key);

  @override
  State<CategoryListItemView> createState() => _CategoryListItemViewState();
}

class _CategoryListItemViewState extends State<CategoryListItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.categorys.icon,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Center(
              child: Text(
                widget.categorys.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Center(
              child: Text(
                widget.categorys.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
