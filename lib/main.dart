// ignore_for_file: avoid_print
// hi this is an added comment for tseting Git.


import 'dart:ui';

import 'package:app4/screens/filter_screen.dart';
import 'package:app4/screens/tabs_screen.dart';

import './screens/meal_detail.dart';

import '../screens/category_meals.dart';
import '../screens/meal_detail.dart';

import 'screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

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
                )
              )),
      //home: categories_screen(),
      //initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreeen(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetail.routeName: (ctx) => MealDetail(),
        filterScreen.routeName: (ctx) => filterScreen(),
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
