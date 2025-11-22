import 'package:flutter/material.dart';
import 'package:movies_app/widgets/home_widgets/categorie_item.dart';
import 'package:movies_app/widgets/home_widgets/texts_style.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final size = const SizedBox(width: 20);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories', style: style()),
            const SizedBox(height: 10),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategorieItem(
                      image: '📺',
                      text: 'Top📈',
                      mediaType: 'tv',
                      query: 'top_rated',
                    ),
                    size,
                    CategorieItem(
                      image: '🎬',
                      text: 'Top📈',
                      mediaType: 'movie',
                      query: 'top_rated',
                    ),
                    size,
                    CategorieItem(
                      image: '📺',
                      text: 'Viral🔥',
                      mediaType: 'tv',
                      query: 'popular',
                    ),
                    size,
                    CategorieItem(
                      image: '🎬',
                      text: 'Viral🔥',
                      mediaType: 'movie',
                      query: 'popular',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
