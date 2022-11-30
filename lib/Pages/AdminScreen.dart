import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class AdminScreen extends StatefulWidget{
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AdminScreenState();
  }


}





class AdminScreenState extends State<AdminScreen>{
  List<Color> colors = [ Colors.indigo  , Colors.deepPurple , Colors.teal , Colors.lightBlueAccent   ] ;
  @override
  Widget build(BuildContext context) {
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
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) => FileInfoCard(colors[index]),
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
                itemCount: 4,
                itemBuilder: (context, index) => SalesStock(colors[index]),
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
  SalesStock(this.color) ;
  @override
  State<StatefulWidget> createState() {
    return SalesStockState();
  }


}

class SalesStockState  extends State<SalesStock>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
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
                    child: Text("Company Samsung ")
                ),
              ) ,
              Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: ProgressLine(
                    percentage: 40),
              ) ,
              Padding(padding: EdgeInsets.all(8) ,
              child:Container(
                padding: EdgeInsets.fromLTRB(8, 2, 16, 4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: const Text(
                    "Number of Stoke Pieces 4 "
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
  FileInfoCard(this.color, {Key? key}) : super(key: key) ;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
        color: color,
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
            "Samsung",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            color: Colors.orange,
            percentage: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rate of sales",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
              ),
              Text(
                "monthly",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
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












