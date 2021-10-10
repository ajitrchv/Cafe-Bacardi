import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class filterScreen extends StatelessWidget {
  static const routeName = './filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter',
        ),
      ),
      drawer:  MainDrawer(),
      body: Container(
        child: const Center(
          child: Text('FilterScreen'),
        ),
      ),
    );
  }
}
