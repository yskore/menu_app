import 'package:flutter/material.dart';

import 'package:menu_app/models/meal.dart';
import 'package:menu_app/widgets/meal_item.dart';
import 'package:menu_app/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, {required Meal meal}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealDetailScreen(
                  meal: meal,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh... Nothing here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
                meal: meals[index],
                onSelectMeal: () {
                  _selectMeal(context, meal: meals[index]);
                });
          });
    }
    if (title == null) {
      return content;
    }

    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
