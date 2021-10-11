import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/Categories';
  final List<Meal> availableMeals;
  CategoryMeals(this.availableMeals);

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
    // ignore: non_constant_identifier_names
    final DisplayMeals = widget.availableMeals.where((mealctx) {
    return mealctx.categories.contains(id);
    }).toList();
    }
   _loadedinitData = true;
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
            complexity: DisplayMeals[indx].complexity, 
          );
        },
        itemCount: DisplayMeals.length,
      ),
    );
  }
}
