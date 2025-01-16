import 'package:flutter/material.dart';
import 'package:coffee/model/data/data_coffee.dart';

class HomeController extends ChangeNotifier {
  // State variables
  List<Coffee> _coffeeList = DataCoffee.listCoffee;
  String _searchQuery = '';
  CoffeeType _selectedType = CoffeeType.all;
  int _selectedIndex = 0;

  // Getters
  List<Coffee> get coffeeList => _coffeeList;
  String get searchQuery => _searchQuery;
  CoffeeType get selectedType => _selectedType;
  int get selectedIndex => _selectedIndex;

  // Navigation categories
  final List<(String, CoffeeType)> categories = [
    ('All Coffee', CoffeeType.all),
    ('Machiato', CoffeeType.machiato),
    ('Latte', CoffeeType.latte),
    ('Americano', CoffeeType.americano),
  ];

  // Search method
  void handleSearch(String query) {
    _searchQuery = query;
    _updateCoffeeList();
    notifyListeners();
  }

  // Type selection method
  void handleTypeSelected(int index) {
    _selectedIndex = index;
    _selectedType = categories[index].$2;
    _updateCoffeeList();
    notifyListeners();
  }

  // Helper method to update coffee list based on search and type
  void _updateCoffeeList() {
    var filteredList = _searchQuery.isEmpty
        ? DataCoffee.listCoffee
        : DataCoffee.searchCoffee(_searchQuery);

    if (_selectedType != CoffeeType.all) {
      filteredList =
          filteredList.where((coffee) => coffee.type == _selectedType).toList();
    }

    _coffeeList = filteredList;
  }
}
