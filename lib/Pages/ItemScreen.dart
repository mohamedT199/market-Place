import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/Models/ItemModel.dart';
import 'package:untitled8/ProviderModels/CartModel.dart';

class ItemScreen extends StatefulWidget {
  Item item;
  ItemScreen(this.item);
  @override
  State<StatefulWidget> createState() {
    return ItemScreenState();
  }
}

class ItemScreenState extends State<ItemScreen> {



  @override
  Widget build(BuildContext context) {
    Item item = widget.item;
    String price = item.price.toString();
    String title = item.name;
    String discription = item.description;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.12),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 0, top: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: (Text(
              '$title',
              style: const TextStyle(
                  color: Color(0xfff19528),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Oswald",
                  fontSize: 18.0),
            )),
          ),
        ),
        actions: <Widget>[Container(child: Image.asset('assets/actions.png'))],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(243, 173, 37, 1),
            child: Image.asset(
              'assets/phone5.png',
              fit: BoxFit.cover,
            ),
          ),

          // Main Body

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$price \$',
                        style: const TextStyle(
                            color: Color(0xff0c0a0b),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Oswald",
                            fontSize: 43.0,
                            fontStyle: FontStyle.normal),
                      ),
                      const Text(
                        'Price may very depends on ingredientes',
                        style: TextStyle(
                            color: Color(0xff0c0a0b),
                            fontWeight: FontWeight.w300,
                            fontFamily: "Oswald-Extra",
                            fontSize: 7.0,
                            fontStyle: FontStyle.normal),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Container(
                        width: 115,
                        height: 0.8,
                        color: Color(0xfff19528),
                      )
                    ],
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                    right: 50,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const Text("SAMSUNG",
                              style: TextStyle(
                                  color:
                                      Color.fromRGBO(255, 255, 255, 0.12),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Oswald",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 64.0)),
                          const Text("Phones",
                              style: TextStyle(
                                  color:
                                      Color.fromRGBO(255, 255, 255, 0.12),
                                  fontWeight: FontWeight.w100,
                                  fontFamily: "Oswald",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 48.0)),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 151,
                            height: 119,
                            child: Text(
                              "$discription",
                              style: const TextStyle(
                                color:
                                Color(0xff0c0a0b),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 8.0,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ) ,
                          Selector<Cart, int>(
                              builder: (context, value, child) {
                                return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 42,
                                      width: 131,
                                      child: const Center(
                                          child: Text(
                                            "ADD TO CART",
                                            style: TextStyle(
                                                color: Color(0xff0c0a0b),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Oswald",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.0),
                                          ) ),
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(243, 173, 37, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                    ));
                              },
                              selector: (context, value) => value.itemCount)
                          ,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 50, bottom: 45),
                    child: Container(
                        width: 195.5,
                        height: 355,
                        child: Image.asset(
                          "assets/phone6.png",
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )),
                  )
                ],
              ),
            ],
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



