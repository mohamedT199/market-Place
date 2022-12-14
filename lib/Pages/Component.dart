import 'package:flutter/material.dart';




import 'LoginScreen.dart';



Widget buildDefaultTextFormField({

  required TextEditingController controller,

  required TextInputType keyboardType,

  required validate,

  required String label,

  required String hint,

  required IconData prefix,

  required Color prefixColor,

  IconData? suffix,

  Color? suffixColor,

  suffixPressed, // Function

  bool isSecure = false,

  onSubmit,

  onChange,

  Function()? onTap,

  bool isClickable = true,

}) =>

    TextFormField(

        obscureText: isSecure,

        validator: validate,

        controller: controller,

        decoration: InputDecoration(

            labelText: label,

            hintText: hint,

            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(15),

              borderSide: const BorderSide(color: Colors.red),

            ),

            prefixIcon: Icon(prefix, color: prefixColor),

            suffixIcon: IconButton(

                onPressed: suffixPressed,

                icon: Icon(suffix, color: suffixColor))),

        keyboardType: keyboardType,

        onFieldSubmitted: onSubmit,

        onChanged: onChange,

        onTap: onTap,

        enabled: isClickable);



Widget buildTaskItemListTile(Map model) => Padding(

  padding: const EdgeInsets.all(20.0),

  child: ListTile(

    leading:

    Text("${model['time']}", style: const TextStyle(color: Colors.red)),

    title: Text("${model['title']}",

        style: const TextStyle(

            color: Colors.black,

            fontSize: 20,

            fontWeight: FontWeight.bold)),

    subtitle: Text("${model['date']}"),

  ),

);

Widget emptyScreen({

  required IconData iconScreen,

  required String textToAttention,

}) {

  return Center(

    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

      Icon(

        iconScreen,

        size: 100,

        color: Colors.black26,

      ),

      Text(

        textToAttention,

        style: const TextStyle(color: Colors.black26),

        maxLines: 2,

        overflow: TextOverflow.clip,

      ),

    ]),

  );

}



// Widget buildArticleItem(article, context) {

//   return InkWell(

//     onTap: () {

//       navigateTO(

//         context,

//         WebViewScreen(

//           article['url'],

//         ),

//       );

//     },

//     child: Padding(

//       padding: const EdgeInsets.all(10.0),

//       child: Row(

//         children: [

//           // Container(

//           //   width: 100,

//           //   height: 100,

//           //   decoration: BoxDecoration(

//           //     borderRadius: BorderRadius.circular(30),

//           //     image: article['urlToImage'] != null

//           //         ? DecorationImage(

//           //             image: NetworkImage(article['urlToImage']),

//           //             fit: BoxFit.cover,

//           //           )

//           //         : DecorationImage(

//           //             image: AssetImage("assets/images/ima.png"),

//           //           ),

//           //   ),

//           // ),

//           const SizedBox(width: 20),

//           Expanded(

//             child: SizedBox(

//               height: 120,

//               child: Column(

//                 crossAxisAlignment: CrossAxisAlignment.start,

//                 mainAxisAlignment: MainAxisAlignment.start,

//                 mainAxisSize: MainAxisSize.min,

//                 children: [

//                   Expanded(

//                     child: article['title'] != null

//                         ? Text(

//                             '${article['title']}',

//                             style: Theme.of(context).textTheme.bodyText1,

//                             overflow: TextOverflow.ellipsis,

//                             maxLines: 3,

//                           )

//                         : Text(

//                             'No Title',

//                             style: Theme.of(context).textTheme.bodyText1,

//                             overflow: TextOverflow.ellipsis,

//                             maxLines: 3,

//                           ),

//                   ),

//                   article['publishedAt'] != null

//                       ? Text('${article['publishedAt']}',

//                           style: Theme.of(context).textTheme.caption,

//                           overflow: TextOverflow.ellipsis)

//                       : Text('No Date',

//                           style: Theme.of(context).textTheme.caption,

//                           overflow: TextOverflow.ellipsis),

//                 ],

//               ),

//             ),

//           )

//         ],

//       ),

//     ),

//   );

// }



// Widget articleBuilder(list, {isSeearch = false}) {

//   if (list.length > 0) {

//     return ListView.separated(

//       itemBuilder: (context, index) {

//         return buildArticleItem(list[index], context);

//       },

//       itemCount: list.length,

//       physics: const BouncingScrollPhysics(),

//       separatorBuilder: (context, index) {

//         return const Divider(

//           height: 10,

//         );

//       },

//     );

//   } else {

//     return isSeearch == false

//         ? const Center(child: CircularProgressIndicator())

//         : const Center(

//             child: Text("No Search item here"),

//           );

//   }

// }



Future navigateTO(context, widget) {

  return Navigator.push(

      context, MaterialPageRoute(builder: (context) => widget));

}



Future navigateTOAndReplacement(context, widget) {

  return Navigator.pushReplacement(

    context,

    MaterialPageRoute(builder: (context) => widget),

  );

}





enum ToastStates{SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state){

  Color color ;

  switch(state){

    case ToastStates.SUCCESS:

      color= Colors.green;

      break;



    case ToastStates.ERROR:

      color= Colors.red;

      break;

    case ToastStates.WARNING:

      color= Colors.amberAccent;

      break;

  }

  return color;

}

// Widget buildDefaultElevatedButton(){

//   return Container(

//                   width: double.infinity,

//                   child: ElevatedButton(

//                     onPressed: () {},

//                     child: Text("Login"),

//                   ),

//                 );

// }