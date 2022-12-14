//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/Pages/HomePage.dart';
import 'package:untitled8/ProviderModels/CartModel.dart';



import '../Models/userModel.dart';

import 'Component.dart';





class LoginScreen extends StatefulWidget {

  @override

  State<LoginScreen> createState() => _LoginScreenState();

}



class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();



  @override

  Widget build(BuildContext context) {

    var emailController = TextEditingController();

    var passwordController = TextEditingController();

    List<UserModel> users = [

      UserModel(email: 'yusuf@gmail.com',password: "111" , isAdmin: true),

      UserModel(email: 'mohammed@gmail.com', password: "122" , isAdmin: true),

      UserModel(email: 'hisham@gmail.com', password: "211", isAdmin: false),

      UserModel(email: 'mariam@gmail.com', password: "222", isAdmin: false),

      UserModel(email: 'jooo@gmail.com', password: "233", isAdmin: false),

      UserModel(email: 'anwer@gmail.com', password: "244", isAdmin: false),

      UserModel(email: 'amr@gmail.com', password: "255", isAdmin: false),

    ];

    return Scaffold(

      // appBar: AppBar(

      //   title: Text('Login Screen'),

      // ),

      backgroundColor: Color.fromRGBO(243, 173, 37, 1),

      body: Center(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.all(20.0),

            child: Form(

              key: formKey,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Text(

                    "Login",

                    style: TextStyle(

                        fontSize: 40,

                        color: Colors.black,

                        fontWeight: FontWeight.bold),

                  ),

                  const Text(

                    "Welcome to your amazing world",

                    style: TextStyle(fontSize: 16, color: Colors.black54),

                  ),

                  SizedBox(

                    height: 10,

                  ),

                  buildDefaultTextFormField(

                    controller: emailController,

                    keyboardType: TextInputType.emailAddress,

                    validate: (value) {

                      if (value.isEmpty) {

                        return 'please enter a valid email address';

                      }

                    },

                    label: 'Email',

                    hint: 'email address',

                    prefix: Icons.email,

                    prefixColor: Colors.black,

                    onSubmit: (value) {

                      if (formKey.currentState!.validate()) {

                        value = passwordController.text;

                      }

                    },

                  ),

                  SizedBox(

                    height: 20,

                  ),

                  buildDefaultTextFormField(

                    controller: passwordController,

                    keyboardType: TextInputType.visiblePassword,

                    validate: (value) {

                      if (value.isEmpty) {

                        return 'please enter a Password';

                      }

                    },

                    label: 'Password',

                    hint: 'your password',

                    prefix: Icons.lock,

                    prefixColor: Colors.black,

                    onSubmit: (value) {

                      if (formKey.currentState!.validate()) {

                        value = passwordController.text;

                      }

                    },

                  ),

                  const SizedBox(

                    height: 10,

                  ),

              Container(

                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    if (formKey.currentState!.validate()) {

                      String name = emailController.text;

                      String password = passwordController.text;

                      print("---------------------------") ;
                      print(name) ;
                      print("---------------------------") ;
                      print(password);

                      UserModel user = users.firstWhere((element) {

                        return  element.email.trim().compareTo(name) == 0 && element.password.trim().compareTo(password) == 0 ;
                      }) ;


                      Provider.of<Cart>(context , listen: false ).setAdmin(user.isAdmin) ;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()));

                    }

                  },

                  child: Text("Login"),

                  // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)  ),

                ),

              ),

                ],

              ),

            ),

          ),

        ),

      ),

    );

  }

}