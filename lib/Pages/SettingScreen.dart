import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/ProviderModels/AppDetials.dart';

class SettingScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SettingScreenState();
  }


}

class SettingScreenState extends State<SettingScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Setting ")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2  ,
                  child: Consumer<Details>(builder:  (context, valuee, child) {
                    return CheckboxListTile(
                      selectedTileColor: Colors.black38,
                      title: const Text("Theme"),
                      tileColor: Colors.black38,
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      checkColor: Colors.white,
                      subtitle: const Text("change theme color "),
                      activeColor: Colors.black38,
                      value: valuee.theme,
                      onChanged: (bool? value) {
                        valuee.changeTheme(value!) ;
                      },
                    );
                  },),
                ) ,

              ],
            ),
          ],
        ),
      ),
    );
  }




}