import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:gmail_auth/pages/login_page.dart';
import 'package:gmail_auth/pages/home_page.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCCWqB5okFWQZWGhOo31Smcd4P1Q_yZUdw",
        appId: "1:346804736993:web:6ab3e79fdd058d80e3f8a0",
        messagingSenderId: "346804736993",
        projectId: "brew-crew-d9210")
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Initialize Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login with gmail",
      initialRoute: firebaseAuth != null && firebaseAuth!.currentUser != null ? "/" : '/login',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }

}

