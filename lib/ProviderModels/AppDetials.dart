


import 'package:flutter/cupertino.dart';
import 'package:untitled8/Models/ItemModel.dart';

class Details with ChangeNotifier {
  bool theme = false ;
  final List<Item> _items = [
    Item(name: 'S2 OUTs-LINE', price: 250.0 , description: "Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg"),
    Item(name: 'CR5 KR_ONLINE', price: 350.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone2.jpg"),
    Item(name: 'F2K -IN line', price: 900.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company " , image:  "assets/realphone3.jpg"),
    Item(name: 'KJ DFz Online', price: 2930.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg"),
    Item(name: 'a2D P-Online', price: 160.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone2.jpg"),
    Item(name: 'Rr tT store', price: 200.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone3.jpg"),
    Item(name: 'FD3 - FC Online', price: 1200.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone1.jpg"),
    Item(name: 'Mkm - Je Inline ', price: 650.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone2.jpg"),
    Item(name: 'Da - oIcln Kstore', price: 320.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone3.jpg"),
    Item(name: 'FJh - JStore', price: 540.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg"),
  ];

  changeTheme(bool value){
    theme = value ;
    notifyListeners() ;
  }

  getAppItems(){
    return _items ;
  }

}