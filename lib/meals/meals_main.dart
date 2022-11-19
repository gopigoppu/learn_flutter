import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import '../main.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mealsTheme(),
      home: CategoriesScreen(),
      routes: {
        // '/': (ctx) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        print(settings.name);

        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        // show generic error page
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
