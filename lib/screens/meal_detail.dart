import 'package:flutter/material.dart';
import '../dummy_data.dart';

// ignore: use_key_in_widget_constructors
class MealDetail extends StatelessWidget {
  static const routeName = '/categorymeals';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

//=============================================================================================================================================

  Widget buildContainerListview(BuildContext context, Widget child) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final MediaQueryData queryData = MediaQuery.of(context);
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      height: queryData.size.height - 600,
      width: queryData.size.width - 40,
      child: child,
    );
  }

//=============================================================================================================================================

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: SizedBox(
                //padding: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //==========================================================================================================================================

            Column(
              children: [
                buildSectionTitle(context, 'Ingredients'),

                buildContainerListview(
                    context,
                    ListView.builder(
                      itemBuilder: (ctx, indx) => Card(
                        // ignore: deprecated_member_use
                        color: Theme.of(context).accentColor,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            '${indx + 1}) ${selectedMeal.ingredients[indx]}.',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      itemCount: selectedMeal.ingredients.length,
                    )),

                //==========================================================================================================================================

                Divider(),

                //============================================
                buildSectionTitle(context, 'Steps'),
                buildContainerListview(
                  context,
                  ListView.builder(
                    itemBuilder: (ctx, indx) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${indx + 1}'),
                          ),
                          title: Text(selectedMeal.steps[indx]),
                        ),
                        Divider(),
                      ],
                    ),
                    itemCount: selectedMeal.steps.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop(mealId);
          }),
    );
  }
}
