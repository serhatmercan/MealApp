import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs["id"];

      categoryTitle = routeArgs["title"];
      categoryMeals = widget.availableMeals.where((element) => element.categories.contains(categoryId)).toList();

      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: categoryMeals.length,
      itemBuilder: (ctx, index) => buildMealItem(index),
    );
  }

  MealItem buildMealItem(int index) {
    return MealItem(
      id: categoryMeals[index].id,
      title: categoryMeals[index].title,
      imageUrl: categoryMeals[index].imageUrl,
      duration: categoryMeals[index].duration,
      complexity: categoryMeals[index].complexity,
      affordability: categoryMeals[index].affordability,
    );
  }
}
