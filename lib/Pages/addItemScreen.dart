import 'dart:ffi';

import 'package:flutter/material.dart';


import 'package:flutter/src/foundation/key.dart';

import 'package:flutter/src/widgets/container.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/Models/ItemModel.dart';
import 'package:untitled8/ProviderModels/AppDetials.dart';


import 'dart:io';

import 'Component.dart';



class AddItemScreen extends StatefulWidget {

  String company ;

   AddItemScreen(this.company , {Key? key}) : super(key: key);



  @override

  State<AddItemScreen> createState() => _AddItemScreenState();

}



// File? imageSellected;

//final _imagePicker = ImagePicker();

File? imageSellected;



class _AddItemScreenState extends State<AddItemScreen> {

  @override

  Widget build(BuildContext context) {

    var nameController = TextEditingController();

    var priceController = TextEditingController();

    var descriptionController = TextEditingController();

    var TotalController = TextEditingController();

    var CompanyController = TextEditingController();


    var imageController = TextEditingController();

    // File? imageSellected;
    CompanyController.text = widget.company ;


    return Scaffold(

      appBar: AppBar(),

      body: Padding(

        padding: const EdgeInsets.all(10.0),

        child: SingleChildScrollView(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Text(

                "Add your new items' details",

                style: TextStyle(

                    fontSize: 40,

                    color: Colors.black,

                    fontWeight: FontWeight.bold),

              ),

              // const Text(

              //   "Please put",

              //   style: TextStyle(fontSize: 16, color: Colors.black54),

              // ),

              SizedBox(

                height: 10,

              ),

              buildDefaultTextFormField(

                  controller: nameController,

                  keyboardType: TextInputType.name,

                  validate: (value) {

                    if (value.isEmpty) {

                      return 'please enter a valid email address';

                    }

                  },

                  label: 'Item name',

                  hint: '',

                  prefix: Icons.indeterminate_check_box_rounded,

                  prefixColor: Color.fromRGBO(243, 173, 37, 1)),



              SizedBox(

                height: 20,

              ),

              buildDefaultTextFormField(

                  controller: priceController,

                  keyboardType: TextInputType.number,

                  validate: (value) {

                    if (value.isEmpty) {

                      return 'please enter a valid email address';

                    }

                  },

                  label: 'Item Price',

                  hint: '',

                  prefix: Icons.price_change,

                  prefixColor: Color.fromRGBO(243, 173, 37, 1)),



              SizedBox(

                height: 20,

              ),

              buildDefaultTextFormField(

                  controller: descriptionController,

                  keyboardType: TextInputType.name,

                  validate: (value) {

                    if (value.isEmpty) {

                      return 'please enter a valid Description';

                    }

                  },

                  label: 'Item Description',

                  hint: '',

                  prefix: Icons.announcement_rounded,

                  prefixColor: Color.fromRGBO(243, 173, 37, 1)),
              SizedBox(

                height: 20,

              ),
              buildDefaultTextFormField(

                  controller: TotalController,

                  keyboardType: TextInputType.name,

                  validate: (value) {

                    if (value.isEmpty) {

                      return 'please enter a Total Pieces';

                    }

                  },

                  label: 'Item Total Pieces',

                  hint: '',

                  prefix: Icons.announcement_rounded,

                  prefixColor: Color.fromRGBO(243, 173, 37, 1)),




              SizedBox(

                height: 20,

              ),


              buildDefaultTextFormField(

                  controller: CompanyController,

                  keyboardType: TextInputType.name,


                  validate: (value) {

                    if (value.isEmpty) {

                      return 'please enter a Company';

                    }

                  },

                  label: 'Item Company',

                  hint: '',

                  prefix: Icons.announcement_rounded,

                  prefixColor: Color.fromRGBO(243, 173, 37, 1)),


              SizedBox(

                height: 20,

              ),
              Column(

                children: [
                  ElevatedButton(

                    onPressed: () {
                        Provider.of<Details>(context , listen: false).addItem(
                          Item(name: nameController.text, price: double.parse(priceController.text), description: descriptionController.text, image: "assets/realphone2.jpg", company: CompanyController.text, total: int.parse(TotalController.text))
                        );

                        Navigator.pushNamed(context, "/page4");


                    },

                    child: Text("Pick Image Galary"),

                  ),

                ],

              )

            ],

          ),

        ),

      ),

    );

  }






}