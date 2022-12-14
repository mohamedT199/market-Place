

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled8/Models/ItemModel.dart';
import 'package:untitled8/Pages/addItemScreen.dart';

import 'package:untitled8/ProviderModels/AppDetials.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/Pages/HomePage.dart';
import 'package:untitled8/ProviderModels/CartModel.dart';




class AdminScreen extends StatefulWidget{
   AdminScreen({Key? key}) : super(key: key);

  final Map<String , Color> ColorsCompany = {
    "apple" :   Colors.indigo,
    "xmi"  : Colors.deepPurple ,
    "oppo" :  Colors.teal ,
    "samsung" : Colors.lightBlueAccent ,
  } ;
  @override
  State<StatefulWidget> createState() {
    return AdminScreenState();
  }


}





class AdminScreenState extends State<AdminScreen>{

  List<Color> colors = [ Colors.indigo  , Colors.deepPurple , Colors.teal , Colors.lightBlueAccent   ] ;
  @override
  Widget build(BuildContext context) {
    Details provider = Provider.of<Details>(context , listen: false );
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel") , ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child:  Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Sailed Product Rate" , style: TextStyle(fontSize: 22),),

              ),
            ),
            Divider(thickness: 1 , endIndent: 100 , indent: 10) ,

        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: provider.getCompanyNamesLength(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) => FileInfoCard(widget.ColorsCompany.entries.firstWhere((element) => element.key.compareTo(provider.getAppItems()[index].company) == 0 ).value ?? Colors.red,provider.getCompanyNames()[index] , provider.getTotalItemOfCompany(provider.getCompanyNames()[index]) , provider.getStorageTotalItemOfCompany(provider.getCompanyNames()[index]) , provider.getCompanyNames()[index]   ),
          ),
        ) ,
            //const SizedBox(height: 8,) ,
            //const Divider( thickness: 2 , endIndent: 20 , indent: 20,  ) ,
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child:  Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Stock Product " , style: TextStyle(fontSize: 22),),

              ),
            ),
            Divider(thickness: 1 , endIndent: 100 , indent: 10) ,

            Container(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.getAppItemsLength() ,
                itemBuilder: (context, index) => SalesStock( widget.ColorsCompany.entries.firstWhere((element) => element.key.compareTo(provider.getAppItems()[index].company) == 0 ).value  ,provider.getAppItems() ,  index , provider.getStorageItems()),
              ),
            ) ,
          ],
        ),
      ),
    ) ;
  }
}






class SalesStock extends StatefulWidget {
  Color color ;
  List<Item> AfterSoldItems ;
  int index ;
  List<Item> Stockitems ;
  SalesStock(this.color ,this.AfterSoldItems ,  this.index , this.Stockitems) ;
  @override
  State<StatefulWidget> createState() {
    return SalesStockState();
  }


}

class SalesStockState  extends State<SalesStock>{

  getRate(){
    return (((widget.AfterSoldItems[widget.index].total)/(widget.Stockitems[widget.index].total))*100).toInt() ;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
        child: Container(
          decoration: BoxDecoration(
            color: widget.color.value != null  ? widget.color :  Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 4, 16, 2),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text("Company : ${widget.Stockitems[widget.index].company} ")
                ),
              ) ,
              Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: ProgressLine(
                    percentage: getRate()),
              ) ,
              Padding(padding: EdgeInsets.all(8) ,
              child:Container(
                padding: EdgeInsets.fromLTRB(8, 2, 16, 4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child:  Text(
                    "Number of Sold Pieces ${widget.Stockitems[widget.index].total - widget.AfterSoldItems[widget.index].total} of total ${widget.Stockitems[widget.index].total} "
                ),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }


}




class FileInfoCard extends StatelessWidget {
  Color color ;
  String Company ;
  int totalSold ;
  int totalStroage ;
  String company ;
  FileInfoCard(this.color, this.Company, this.totalSold , this.totalStroage , this.company , {Key? key}) : super(key: key) ;

  getRate(){
    print(company) ;
    print("-------------------") ;
    print(((totalSold/totalStroage)*100)) ;
    print(totalSold);
    print(totalStroage);
    return ((totalSold/totalStroage)*100).toInt() ;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen(Company)));

      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration:  BoxDecoration(
          color: color.value != null  ? color :  Colors.red,
          borderRadius: const  BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10 * 0.75),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Icon(Icons.accessibility_new_sharp)
                ),
                const Icon(Icons.more_vert, color: Colors.white54)
              ],
            ),
            Text(
              Company,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            ProgressLine(
              color: Colors.orange,
              percentage: getRate(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Storage : $totalStroage",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white70),
                ),
                Text(
                  "Sold : ${totalStroage - totalSold}",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = Colors.orange,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}












