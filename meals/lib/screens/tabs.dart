import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories.dart';
import 'meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(bool isFavorite) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1, milliseconds: 500),
        content: Text(
          isFavorite ? 'Meal added as a favorite.' : 'Meal removed.',
        ),
      ),
    );
  }

  void _toggleFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _showInfoMessage(false);
        _favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        _showInfoMessage(true);
        _favoriteMeals.add(meal);
      });
    }
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).pushNamed('/filters');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleFavoriteStatus,
    );
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePageTitle = 'Your Favorites';
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavoriteStatus,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      body: activePage,
    );
  }
}
