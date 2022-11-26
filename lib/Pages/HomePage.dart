import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/Models/ItemModel.dart';
import 'package:untitled8/Pages/ItemScreen.dart';
import 'package:untitled8/Pages/SearchScreen.dart';
import 'package:untitled8/ProviderModels/AppDetials.dart';
import 'package:untitled8/ProviderModels/CartModel.dart';
//import 'package:untitled8/UserData.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  bool checked = true ;
  List<Item> items = [
    Item(name: 'S2 OUT-LINE', price: 250.0 , description: "Phone From Samsung  this phone is made by the samsaung company "),
    Item(name: 'CR5 KR_ONLLINE', price: 350.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company "),
    Item(name: 'S2 OUT-LINE', price: 250.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company "),
    Item(name: 'CR5 KR_ONLLINE', price: 350.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company "),
    Item(name: 'S2 OUT-LINE', price: 250.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  "),
    Item(name: 'CR5 KR_ONLLINE', price: 350.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company "),
    Item(name: 'S2 OUT-LINE', price: 250.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  "),
    Item(name: 'CR5 KR_ONLLINE', price: 350.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company "),
    Item(name: 'S2 OUT-LINE', price: 250.0 , description: "Phone From Samsung Phone From Samsung  this phone is made by the samsaung company  "),
    Item(name: 'CR5 KR_ONLLINE', price: 350.0 , description: "Phone From SAWME Phone From Samsung  this phone is made by the samsaung company "),
  ];

  cartIcon(String itemCount) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: 150.0,
            width: 30.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/page1");
              },
              child: Stack(
                children: <Widget>[
                  const IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                  items.isEmpty
                      ? Container()
                      : Positioned(
                          child: Stack(
                          children: <Widget>[
                            Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.green[800]),
                            Positioned(
                                top: 4.0,
                                right: 6.0,
                                child: Center(
                                  child: Text(
                                    itemCount,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                ],
              ),
            )),
      );

  //checkBoxTheme() =>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hi , Mohamed "),
        actions: [
          Selector<Cart, int>(
              builder: (context, value, child) {
                return cartIcon(value.toString());
              },
              selector: (context, value) => value.itemCount),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/page2");
          }, icon: const Icon(Icons.adjust)) ,
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen(items)));
          }, icon: const Icon(Icons.search)) ,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) {
                  return Card(child: Consumer<Cart>(
                    builder: (context, value, child) {
                      return ListTile(
                        title: Text(items[i].name),
                        subtitle: Text(items[i].description) ,
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ItemScreen(items[i])));
                        },
                        trailing: IconButton(
                            onPressed: () {
                              value.addItem(items[i]);
                            },
                            icon: const Icon(Icons.add_shopping_cart)),
                      );
                    },
                  ));
                }),
          ),
        ]),
      ),
    );
  }
}
