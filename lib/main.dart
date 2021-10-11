// ignore_for_file: avoid_print

import 'dart:ui';

import '../dummy_data.dart';
import '../screens/filter_screen.dart';
import '../screens/tabs_screen.dart';
import '../models/meal.dart';

import './screens/meal_detail.dart';

import '../screens/category_meals.dart';
import '../screens/meal_detail.dart';

import 'screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = dummyMeals;

  List<Meal> _favMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((Meal) {
        //..
        if (_filters['gluten'] == false && !Meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == false && !Meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == false && !Meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == false && !Meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFav(String mealId) {
    final existingIndex = _favMeals.indexWhere((Meal) => Meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favMeals.removeAt(existingIndex);
      });
    }
      else{
        setState(() {
          _favMeals.add(dummyMeals.firstWhere((Meal) => Meal.id == mealId));
        });
      }
    }

    bool _isMealFavorite(String id) {
      return _favMeals.any((Meal) => Meal.id == id); 
    }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Bacardi',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          // ignore: deprecated_member_use
          accentColor: Colors.red,
          canvasColor: Colors.yellow[100],
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: categories_screen(),
      //initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreeen(_favMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetail.routeName: (ctx) => MealDetail(_toggleFav, _isMealFavorite),
        filterScreen.routeName: (ctx) => filterScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        //return MaterialPageRoute(builder: (ctx) => categories_screen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => categories_screen());
      },
    );
  }
}

//=======================================================

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<_MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MealsApp'),
      ),
      body: const Center(
        child: Text('Hi Centred  Text'),
      ),
    );
  }
}
