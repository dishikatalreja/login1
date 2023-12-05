import 'package:flutter/material.dart';
import 'package:login1/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


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
                'Welcome Back!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(height: 60),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter your mail id",
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
                  labelText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.brown, width: 2),
                  ),
                ),
              ),
              // SizedBox(height: 20),
              // TextField(
              //   decoration: InputDecoration(
              //       suffixText:"Enter your Contact number",
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(25),
              //           borderSide: BorderSide(
              //             color: Colors.brown,
              //             width: 2,
              //           )
              //       )
              //   ),
              // ),
              // SizedBox(height: 20),
              // TextField(
              //   decoration: InputDecoration(
              //       suffixText:"Enter password",
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(25),
              //           borderSide: BorderSide(
              //             color: Colors.brown,
              //             width: 2,
              //           )
              //       )
              //   ),
              // ),
              SizedBox(height: 70),
              TextButton(
                onPressed: () async {
                  UserCredential? user = await signInWithGoogle();
                  if (user != null) {
                    // Successfully signed up with Google
                    print("User signed in: ${user.user!.displayName}");
                  } else {
                    // Sign-in failed
                    print("Sign-in failed");
                  }
                },
                child: Text(
                  '                Log In               ',
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
