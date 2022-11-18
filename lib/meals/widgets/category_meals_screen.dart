import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.categoryId, this.categoryTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    // print(routeArgs);
    final categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'] as String;
    final color = routeArgs['color'] as MaterialColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: color,
      ),
      body: const Center(
        child: Text('The Recipes For the category!'),
      ),
    );
  }
}
