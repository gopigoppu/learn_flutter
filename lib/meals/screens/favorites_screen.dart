import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favriteMeals;

  const FavoritesScreen(this.favriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            id: favriteMeals[index].id,
            title: favriteMeals[index].title,
            imageUrl: favriteMeals[index].imageUrl,
            duration: favriteMeals[index].duration,
            complexity: favriteMeals[index].complexity,
            affordability: favriteMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        }),
        itemCount: favriteMeals.length,
      );
    }
  }
}
