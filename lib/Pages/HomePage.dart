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
                            const Icon(Icons.brightness_1,
                                size: 20.0, color: Color.fromRGBO(243, 173, 37, 1)),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 65),
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/page5', (Route route) => false);
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 65.0),
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/page6', (Route route) => false);
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 60.0,
        width: 60.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/page4', (Route route) => false);
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
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
                        leading: Image.asset(
                          items[i].image,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(items[i].description),
                            Divider(thickness: 0.5 , ) ,
                            Text(
                                "Price ${items[i].price}"
                            ),
                          ],
                        ) ,

                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ItemScreen(items[i])));
                        },
                        trailing: IconButton(
                            onPressed: () {
                              value.addItem(items[i]);
                            },
                            icon: const Icon(Icons.add_shopping_cart , color: Color.fromRGBO(243, 173, 37, 1),)),
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
