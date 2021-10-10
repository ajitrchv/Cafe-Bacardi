import '../models/meal.dart';
import 'package:app4/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/Categories';

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {

String categoryTtle='';
List<Meal> DisplayMeals=dummyMeals;
bool _loadedinitData = false;
  void initState() 
  {
   
    super.initState();
  }

    void didChangeDependencies() 
    {
      if (_loadedinitData == false){

    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? cuisine = routeArgs['title'];
    final String? id = routeArgs['id'];
    final DisplayMeals = dummyMeals.where((mealctx) {
    return mealctx.categories.contains(id);
    }).toList();
    }
   _loadedinitData = true;
    }

    void _removeMeal(String mealId)
  {
      setState(() {
        DisplayMeals.removeWhere((meal) => meal.id == mealId);
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, indx) {
          return MealItem(
            id: DisplayMeals[indx].id,
            title: DisplayMeals[indx].title,
            imageUrl: DisplayMeals[indx].imageUrl,
            duration: DisplayMeals[indx].duration,
            affordability: DisplayMeals[indx].affordability,
            complexity: DisplayMeals[indx].complexity, removeItem: _removeMeal,
          );
        },
        itemCount: DisplayMeals.length,
      ),
    );
  }
}
