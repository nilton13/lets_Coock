import 'package:flutter/material.dart';
import 'package:lets_cook/models/meal.dart';

import 'category_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals; 

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  
  late List<String> _titles;
  late List<Widget> _screens;

  @override
  void initState(){
    super.initState();

    _titles = [
      'Lista de Categorias',
      'Meus Favoritos',
    ];

     _screens = [
        CategoryScreen(),
        FavoriteScreen(widget.favoriteMeals),
      ];
  }

  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: Text(
          _titles[_selectedScreenIndex]
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: Colors.pink,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos'
          ),
        ],
      ),
    );
  }
}