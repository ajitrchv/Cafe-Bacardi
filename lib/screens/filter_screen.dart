import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class filterScreen extends StatefulWidget {
  static const routeName = './filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  filterScreen(this.currentFilter, this.saveFilters);

  @override
  State<filterScreen> createState() => _filterScreenState();
}

// ignore: camel_case_types
class _filterScreenState extends State<filterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  initState() {
    print('in initstate');
    _glutenFree = widget.currentFilter['gluten']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    // ignore: unused_element

    // print('GlutenFree value: $_glutenFree');
    // print('vegetarian value: $_vegetarian');
    // print('vegan value: $_vegan');
    // print('lactose value: $_lactoseFree');

    Widget _buildSwitchTile(
        String foodType, bool? currentValue, Function updateValue) {
      // ignore: unrelated_type_equality_checks
      if (currentValue == 0) {
        currentValue = false;
      } else {
        currentValue = true;
      }
      return SwitchListTile(
        title: Text(foodType),
        subtitle: Text('Only include $foodType meals'),
        value: currentValue,
        onChanged: //(value) { updateValue(value); }
            (bool value) {
          setState(() {
            print('currentValue: $currentValue');
            currentValue = value;
            print('currentValue after set state: $currentValue');
            updateValue(currentValue);
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter',
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  'Gluten-Free',
                  _glutenFree,
                  (bool newValue) {
                    setState(() {
                      print('GlutenFree value: $_glutenFree');
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchTile('Lactose-Free', _lactoseFree, (bool newValue) {
                  setState(() {
                    print('Lactose-Free: $_lactoseFree');
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchTile('Vegetarian', _vegetarian, (bool newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchTile('Vegan', _vegan, (bool newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
