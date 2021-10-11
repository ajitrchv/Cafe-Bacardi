import 'package:flutter/cupertino.dart';
import '../dummy_data.dart';
import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class categories_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15),
        children: dummyCategories.map(
            (catData) => CategoryItem(catData.title, catData.color, catData.id)).toList(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
    );
  }
}
