import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealTitle = routeArgs['title'];
    final mealId = routeArgs['id'];

    // final mealSteps = DUMMY_MEALS.where((meal) {
    //   return meal.steps.contains(mealId);
    // }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('$mealTitle')),
      body: Center(
        child: Text('The Meal - $mealId'),
      ),
    );
  }
}
