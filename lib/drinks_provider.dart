import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:prov4/drink.dart';  /// [Expect very lower layer of Flutter]



/// [(1)Make MODEL and Extends ChangeNotifier class]
class DrinksProvider extends ChangeNotifier {

  /// [(2)Initialize the state with drinks]
  List<Drink> _drinks = [   /// [coz only inside, private]
    Drink("Wine", false),
    Drink("Sake", false),
    Drink("Beer", false),
    Drink("Vodka", false),
    Drink("Tequila", false),
    Drink("Gin", false),
  ];

  /// [(3)Write a get for the (2)drinks]
  List<Drink> get drinks => _drinks;

  /// [(7)Add selectDrink method]
  void selectDrink(Drink drink, bool selected) {
    _drinks
        .firstWhere((element) => element.name == drink.name)   /// [firstWhere()]
        .selected = selected;
    notifyListeners();
  }

  /// [(9)Add a getter function for selected drinks]
  List<Drink> get selectedDrinks =>
      _drinks.where((element) => element.selected).toList();  /// [where()]


}