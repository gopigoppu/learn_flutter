import 'package:flutter/material.dart';
import '../main.dart';
import 'widgets/categories_screen.dart';
import 'widgets/category_meals_screen.dart';

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
      routes: {'/category-meals': (ctx) => CategoryMealsScreen()},
    );
  }
}
