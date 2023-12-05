import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login1/main.dart';

import 'google_signup.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 375,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(height: 60),
              TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.brown,
                        width: 2,
                      )),
                  labelText: "Enter your name",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.brown, width: 2),
                  ),
                  labelText: "Enter your mail",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter your Contact number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.brown,
                          width: 2,
                        ))),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.brown,
                          width: 2,
                        ))),
              ),
              SizedBox(height: 70),
              TextButton(
                onPressed: () async{
                    User? user = await AuthService().signUpWithGoogle();
                    if (user != null) {
                      // Successfully signed up with Google
                      print("User signed up: ${user.displayName}");
                    } else {
                      // Sign-up failed
                      print("Sign-up failed");
                    }

                },
                child: Text(
                  '                Sign Up               ',
                  style: TextStyle(fontSize: 28.0),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF40826D)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // TextButton(onPressed:(){
              //   Navigator.pop(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Home Page',),),);
              // }, child: Text('home page'))
            ],
          ),
        ),
      ),
    );
  }
}
