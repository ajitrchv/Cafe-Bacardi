import '../widgets/main_drawer.dart';
import 'package:flutter/gestures.dart';

import '../screens/fav_screen.dart';

import '../screens/categories_screen.dart';
import 'package:flutter/material.dart';

class TabScreeen extends StatefulWidget {
  @override
  _TabScreeenState createState() => _TabScreeenState();
}

class _TabScreeenState extends State<TabScreeen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cafe Bacardi'),
          // leading: Image.asset(
          //   'assets/images/cb.png',

          //   fit: BoxFit.scaleDown,
          //   height: 30,
          //   width: 30,
            
          // ),
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            dragStartBehavior: DragStartBehavior.start,
            enableFeedback: true,
            physics: ScrollPhysics(),
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: ('Categories'),
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: ('Favorites'),
              ),
            ],
          ),
        ),

        drawer: MainDrawer(),

        body: TabBarView(
          children: [
            categories_screen(),
            FavScreen(),
          ],
        ),
      ),
    );
  }
}
