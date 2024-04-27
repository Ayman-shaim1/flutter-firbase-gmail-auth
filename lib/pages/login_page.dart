import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

 void signInWithGoogle() async {
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
    Navigator.of(context).pushReplacementNamed('/');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 30.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 0.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image(
                          width: 80,
                          height: 80,
                          image: AssetImage("assets/mot-de-passe.png")),
                      Text(
                        "Login !",
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                      Text("sing up here !",
                          style: TextStyle(fontSize: 24.0, letterSpacing: 2.0)),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                    width: double.infinity,
                    child: TextField(
                      // C'est la zone de texte
                      decoration: InputDecoration(
                        hintText: 'Enter your text here',
                        // labelText: 'Text Input', // Label text
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Border radius
                          borderSide: BorderSide(
                            // Border color
                            color: Theme.of(context)
                                .colorScheme
                                .secondary, // Set your desired border color here
                            // Border width
                          ),
                        ), // Border
                        prefixIcon: Icon(Icons.email), // Prefix Icon
                        //  suffixIcon: Icon(Icons.search), // Suffix Icon
                        fillColor: Colors.grey[100], // Fill color
                        filled: true,
                      ), // Placeholder text
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password"),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        TextField(
                          // C'est la zone de texte
                          decoration: InputDecoration(
                            hintText: 'Enter your text here',
                            // labelText: 'Text Input', // Label text
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(20.0), // Border radius
                              borderSide: BorderSide(
                                // Border color
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary, // Set your desired border color here
                                // Border width
                              ),
                            ), // Border
                            prefixIcon: Icon(Icons.lock), // Prefix Icon
                            //  suffixIcon: Icon(Icons.search), // Suffix Icon
                            fillColor: Colors.grey[100], // Fill color
                            filled: true,
                          ), // Placeholder text
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("login"))),
              SizedBox(
                  width: double.infinity,
                  child:
                  ElevatedButton(onPressed: () {
                   signInWithGoogle();
                  },
                      style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.white ,// background color
                  ),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(width: 20,height: 20, image: AssetImage("assets/google.png")),
                      SizedBox(width: 10,),
                      Text("login with gmail",style: TextStyle(color: Colors.black),),
                    ],
                  ))),

            ],
          ),
        ),
      )),
    );
  }
}
