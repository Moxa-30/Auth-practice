import 'dart:collection';

import 'package:auth_practice/google_signin.dart';
import 'package:auth_practice/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedIn = false;
  Map? userProfile;
  String? fbuser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "New Spring",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                "Burger",
                style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
              Hero(
                tag: "DemoTag",
                child: Image.asset(
                  "images/burger.png",
                  height: 240,
                ),
              ),
              Text(
                "Food with love only from natural and",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "fresh products.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SignUpScreen(data: data,),
                  //   ),
                  // );
                },
                child: Container(
                  height: 45,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.black,
                    ),
                    Text("OR"),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      FacebookAuth.instance.login(permissions: [
                        "public_profile",
                        "email",
                      ]).then((value) => {
                            FacebookAuth.instance
                                .getUserData()
                                .then((userData) {
                              if (userData.isNotEmpty) {
                                setState(() {
                                  _isLoggedIn = true;
                                  userProfile = userData;
                                  var req = HashMap<String, dynamic>();
                                  req["first_name"] =
                                      userProfile!['name'].split(" ").first;
                                });
                              }
                            })
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black54, width: 2),
                      ),
                      height: 46,
                      width: 46,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "images/facebook.png",
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      signInWithGoogle().whenComplete(() {
                        if (FirebaseAuth.instance.currentUser != null) {
                          var data = HashMap<String, dynamic>();
                          data["fname"] = FirebaseAuth
                              .instance.currentUser!.displayName!
                              .split(' ')
                              .first;
                          data["mobileNo"] = FirebaseAuth
                              .instance.currentUser!.phoneNumber
                              .toString();
                          debugPrint("${FirebaseAuth.instance.currentUser}");
                          debugPrint(
                              FirebaseAuth.instance.currentUser!.phoneNumber);
                          debugPrint("11111111111122222222222222222");
                          debugPrint(
                              FirebaseAuth.instance.currentUser!.displayName!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen(data: data)),
                          );
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black54, width: 2),
                      ),
                      height: 46,
                      width: 46,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "images/google.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member?",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "LOG IN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
