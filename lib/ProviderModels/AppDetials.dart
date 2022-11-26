


import 'package:flutter/cupertino.dart';

class Details with ChangeNotifier {
  bool theme = false ;


  changeTheme(bool value){
    theme = value ;
    notifyListeners() ;
  }

}