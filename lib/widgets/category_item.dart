import '../screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectCategory(context),
      child: buildContainer(),
    );
  }

  Container buildContainer() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: buildBoxDecoration(),
      child: Text(title),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: buildLinearGradient(),
    );
  }

  LinearGradient buildLinearGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        color.withOpacity(0.7),
        color,
      ],
    );
  }
}
