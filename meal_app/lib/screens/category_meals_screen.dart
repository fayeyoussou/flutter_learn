import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();
    return ListView.builder(itemBuilder: ((context, index) {
        Meal categoryMeal = categoryMeals[index];
        return MealItem(
            categoryMeal.id,
            categoryMeal.title,
            categoryMeal.imageUrl,
            categoryMeal.duration, categoryMeal.complexity,
            categoryMeal.affordability, ValueKey(categoryMeal.id));
      }),itemCount: categoryMeals.length,
      
    );
  }
}
