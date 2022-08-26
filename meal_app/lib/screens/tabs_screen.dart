import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';

///  Created by youssouphafaye on 8/26/22.
class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('meals'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
              ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            )
          ]),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen()
        ]),
      )
    );
  }
}
