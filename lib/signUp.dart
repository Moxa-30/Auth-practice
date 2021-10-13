import 'dart:collection';

import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  HashMap<String, dynamic> data;
  SignUpScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding:
              const EdgeInsets.only(top: 62, left: 28, right: 28, bottom: 16),
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.amber),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Hero(
                      tag: "DemoTag", child: Image.asset("images/burger.png")),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 34,
            ),
            TextFormField(
              // keyboardType: TextInputType.text,
              // enabled: true,
              decoration: InputDecoration(
                // labelText: 'First Name',
                hintText: 'Mobile Number',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // keyboardType: TextInputType.text,
              // enabled: true,
              decoration: InputDecoration(
                // labelText: 'First Name',
                hintText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
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
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                "FORGOT PASSWORD",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
