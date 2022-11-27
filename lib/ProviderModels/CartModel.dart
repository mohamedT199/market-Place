import 'package:flutter/cupertino.dart';
import 'package:untitled8/Models/ItemModel.dart';

class Cart with ChangeNotifier{

  List<Item> _items = [];
  double totalPrice = 0.0 ;
  int itemCount = 0 ;
  addItem(Item item) {
    _items.add(item) ;
    totalPrice += item.price ;
    itemCount++ ;
    notifyListeners() ;
  }

  removeItem(Item item) {
    _items.remove(item) ;
    totalPrice -= item.price ;
    itemCount-- ;
    notifyListeners() ;
  }
  get count => itemCount ;

  List<Item> get basketItems => _items ;
  removeItems() {
    _items = [] ;
    totalPrice = 0 ;
    itemCount = 0  ;
    notifyListeners() ;
  }




}