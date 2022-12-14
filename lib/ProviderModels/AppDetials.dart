


import 'package:flutter/cupertino.dart';
import 'package:untitled8/Models/ItemModel.dart';

class Details with ChangeNotifier {
  bool theme = false ;
  List<Item> _Solditems = [];
  final List<Item> _items = [
    Item(name: 'S2 OUTs-LINE', price: 250.0 , description: "Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg" , company: "samsung" , total: 50),
    Item(name: 'CR5 KR_ONLINE', price: 350.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone2.jpg" , company:  "apple" , total: 43 ),
    Item(name: 'F2K -IN line', price: 900.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company " , image:  "assets/realphone3.jpg" , company:  "xmi" , total: 65 ),
    Item(name: 'KJ DFz Online', price: 2930.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg" , company: "oppo" , total: 16),
    Item(name: 'a2D P-Online', price: 160.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone2.jpg" , company:"samsung" , total: 27),
    Item(name: 'Rr tT store', price: 200.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone3.jpg" , company:"apple"  , total:  14),
    Item(name: 'FD3 - FC Online', price: 1200.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone1.jpg" , company: "xmi" , total:  59),
    Item(name: 'Mkm - Je Inline ', price: 650.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone2.jpg" , company:"oppo"  , total:  6),
    Item(name: 'Da - oIcln Kstore', price: 320.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone3.jpg" , company:"samsung"   , total:  8),
    Item(name: 'FJh - JStore', price: 540.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg" , company: "oppo" , total:  12 ),
  ];
  final List<Item> _Storageitems = [
    Item(name: 'S2 OUTs-LINE', price: 250.0 , description: "Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg" , company: "samsung" , total: 50),
    Item(name: 'CR5 KR_ONLINE', price: 350.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone2.jpg" , company:  "apple" , total: 43 ),
    Item(name: 'F2K -IN line', price: 900.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company " , image:  "assets/realphone3.jpg" , company:  "xmi" , total: 65 ),
    Item(name: 'KJ DFz Online', price: 2930.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg" , company: "oppo" , total: 16),
    Item(name: 'a2D P-Online', price: 160.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone2.jpg" , company:"samsung" , total: 27),
    Item(name: 'Rr tT store', price: 200.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone3.jpg" , company:"apple"  , total:  14),
    Item(name: 'FD3 - FC Online', price: 1200.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone1.jpg" , company: "xmi" , total:  59),
    Item(name: 'Mkm - Je Inline ', price: 650.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone2.jpg" , company:"oppo"  , total:  6),
    Item(name: 'Da - oIcln Kstore', price: 320.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  " , image: "assets/realphone3.jpg" , company:"samsung"   , total:  8),
    Item(name: 'FJh - JStore', price: 540.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company " , image: "assets/realphone1.jpg" , company: "oppo" , total:  12 ),
  ];

  changeTheme(bool value){
    theme = value ;
    notifyListeners() ;
  }

  getAppItems(){
    return _items ;
  }
  getStorageItems(){
    return _Storageitems ;
  }
  getAppItemsLength(){
    return _items.length ;
  }
  getStorageItemsLength(){
    return _Storageitems.length ;
  }

  getItemsForSpacificCompany(String company){
    List<Item> items = _items.where((element) => element.company.compareTo(company) == 0 ).toList() ;
    return items ;
  }
  getCompanyNames(){
    List<String> companys = _getListCompany() ;
    List<String> RealCompany = [] ;
    for (String company in companys ){
      if(!RealCompany.contains(company)){
        RealCompany.add(company) ;
      }
    }
    return RealCompany ;
  }
  getCompanyNamesLength(){
    List<String> companys = _getListCompany() ;
    List<String> RealCompany = [] ;
    for (String company in companys ){
      if(!RealCompany.contains(company)){
        RealCompany.add(company) ;
      }
    }
    return RealCompany.length ;
  }


  addItem(Item item){
    _items.add(item) ;
    _Storageitems.add(item) ;
  }

  _getListCompany(){
    List<String> items = [] ;
    for( Item item in _items ){
      items.add(item.company) ;
    }
    return items ;
  }

  addToSoldItems(List<Item> items){

    for(Item item in items){
      int index = _items.indexWhere((element) => element.name.compareTo(item.name) == 0 ) ;
      _items.elementAt(index).total = _items.elementAt(index).total - 1 ;
    }
    notifyListeners();
  }
  getStorageTotalItemOfCompany(String company){
    int total = 0  ;
    for(Item item in _Storageitems){
      if(item.company == company){
        total = total + item.total ;
      }
    }
    return total ;
  }

  getTotalItemOfCompany(String company){
    int total = 0  ;
    for(Item item in _items){
      if(item.company == company){
        total = total + item.total ;
      }
    }
    print("instide Detials $total");
    return total ;
  }

}