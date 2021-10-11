
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavScreen extends StatelessWidget {
  final List<Meal> _favfavMeal;
  FavScreen(this._favfavMeal);
  
  @override
  Widget build(BuildContext context) {
    if(_favfavMeal.isEmpty){
    return const Center(
      child: Text('You have got no Favorites here :('),
    );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, indx) {
          return MealItem(
            id: _favfavMeal[indx].id,
            title: _favfavMeal[indx].title,
            imageUrl: _favfavMeal[indx].imageUrl,
            duration: _favfavMeal[indx].duration,
            affordability: _favfavMeal[indx].affordability,
            complexity: _favfavMeal[indx].complexity,
          );
        },
        itemCount: _favfavMeal.length,
      );
    }
  }
}