import '../widgets/meal_item.dart';
import '../models/meal.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return buildCenter();
    } else {
      return buildListView();
    }
  }

  Center buildCenter() {
    return Center(
      child: Text("You Have No Favorite Meal Yet !"),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, index) => buildMealItem(index),
    );
  }

  MealItem buildMealItem(int index) {
    return MealItem(
      id: favoriteMeals[index].id,
      title: favoriteMeals[index].title,
      imageUrl: favoriteMeals[index].imageUrl,
      duration: favoriteMeals[index].duration,
      affordability: favoriteMeals[index].affordability,
      complexity: favoriteMeals[index].complexity,
    );
  }
}
