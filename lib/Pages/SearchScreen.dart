import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/Models/ItemModel.dart';
import 'package:untitled8/Pages/ItemScreen.dart';
import 'package:untitled8/ProviderModels/CartModel.dart';

class SearchScreen extends StatefulWidget{

  List<Item> items ;
  SearchScreen(this.items);
  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();
  }

}

class SearchScreenState extends State<SearchScreen>{

  List<Item> items = [] ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Screen"),

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
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    onChanged: (search){
                      if(search != ""){

                        setState(() {
                          items = widget.items.where((element){
                            return element.name.contains(search) ;
                          }).toList() ;
                          print("herrre ") ;
                          print(items) ;
                        });
                      }else{
                        setState(() {
                          items = widget.items ;
                          print(items);
                        });
                      }
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          child: const Icon(Icons.search),
                          width: 18,
                        )
                    ),
                  ),
                ),

              ],
            ) ,
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return Card(child: Consumer<Cart>(
                      builder: (context, value, child) {
                        return ListTile(
                          leading: Image.asset(
                            items[i].image,
                          ),
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
          ],
        ),
      ),
    );
  }




}