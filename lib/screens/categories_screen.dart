import '../widgets/category_item.dart';
import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: buildSliverGridDelegateWithMaxCrossAxisExtent(),
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id, e.title, e.color)).toList(),
    );
  }

  SliverGridDelegateWithMaxCrossAxisExtent buildSliverGridDelegateWithMaxCrossAxisExtent() {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    );
  }
}
