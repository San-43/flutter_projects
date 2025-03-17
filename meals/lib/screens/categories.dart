import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../widgets/category_grid_item.dart';
import 'meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              meals:
                  dummyMeals
                      .where((meal) => meal.categories.contains(category.id))
                      .toList(),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your category')),
      body: GridView(
        padding: const EdgeInsets.all(24),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
