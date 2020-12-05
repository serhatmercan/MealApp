import './dummy_data.dart';
import 'models/meal.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters["gluten"] && !element.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !element.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !element.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !element.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0) {
      setState(() => _favoriteMeals.removeAt(existingIndex));
    } else {
      setState(() => _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId)));
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMERCAN Meals',
      theme: buildThemeData(),
      initialRoute: "/",
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => CategoriesScreen()),
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => CategoriesScreen()),
      routes: {
        "/": (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters),
      },
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      accentColor: Colors.amber,
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: "Raleway",
      primarySwatch: Colors.pink,
    );
  }
}
