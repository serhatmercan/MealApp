import '../dummy_data.dart';
import 'package:MealsApp/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: buildBoxDecoration(),
      height: 200,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 300,
      child: child,
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: buildSingleChildScrollView(selectedMeal),
      floatingActionButton: buildFloatingActionButton(mealId),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(Meal selectedMeal) {
    return SingleChildScrollView(
      child: buildColumn(selectedMeal),
    );
  }

  Column buildColumn(Meal selectedMeal) {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            selectedMeal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        buildSectionTitle("Ingredients"),
        buildContainer(
          ListView.builder(
            itemBuilder: (context, index) => Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(selectedMeal.ingredients[index]),
              ),
            ),
            itemCount: selectedMeal.ingredients.length,
          ),
        ),
        buildSectionTitle("Steps"),
        buildContainer(
          ListView.builder(
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text("# ${index + 1}")),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider(),
              ],
            ),
            itemCount: selectedMeal.steps.length,
          ),
        ),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton(String mealId) {
    return FloatingActionButton(
      child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      onPressed: () => toggleFavorite(mealId),
    );
  }
}
