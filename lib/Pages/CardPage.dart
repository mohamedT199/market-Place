import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled8/Models/ItemModel.dart';
import 'package:untitled8/ProviderModels/CartModel.dart';

class CardPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CardPageState();
  }
}

class CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Shop "),
      ),
      body: Column(
        children: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: value.basketItems.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: ListTile(
                          leading: Image.asset(
                            value.basketItems[i].image,
                          ),
                          title: Text(value.basketItems[i].name),
                          trailing: IconButton(
                              onPressed: () {
                                value.removeItem(value.basketItems[i]);
                              },
                              icon: const Icon(Icons.remove_shopping_cart) ,
                            color: const Color.fromRGBO(243, 173, 37, 1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("TOTAL", style: Theme.of(context).textTheme.subtitle2 ),
                    Selector<Cart, double>(
                        builder: (context , value , child){
                          return Text("$value", style: Theme.of(context).textTheme.headlineSmall);
                        } ,
                        selector: (context, value) => value.totalPrice
                    ) ,
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    child: Text(
                      "CHECKOUT",
                      style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/page3");
                    },
                    //color: Colors.black,
                    //shape: RoundedRectangleBorder(
                    //  borderRadius: BorderRadius.circular(15.0),
                    //),
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}

/*
 Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Selector<Cart, double>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                        onPressed: () {}, child: Text("Buy Now , $value"));
                  },
                  selector: (context, value) => value.totalPrice),
            ),
          )
* */
