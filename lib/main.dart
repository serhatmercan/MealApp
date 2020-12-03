import 'package:MealsApp/screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        primarySwatch: Colors.pink,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => CategoriesScreen()),
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => CategoriesScreen()),
      routes: {
        "/": (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
    );
  }
}
