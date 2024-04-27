import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? loggedUser;

  void getUserData(){
   setState(() {
     loggedUser = firebaseAuth.currentUser;
     print(firebaseAuth.currentUser);
   });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 10.0),
          child: Center(
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: loggedUser != null && loggedUser!.displayName != null ? Image.network(loggedUser!.photoURL!)  : Image.asset("assets/user.png",width: 50,height: 50)
                ),
                Text(loggedUser != null && loggedUser!.displayName != null ?  loggedUser!.displayName! : "",
                style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                )
                ),
                
                Text(loggedUser != null && loggedUser!.displayName != null ?  loggedUser!.email! : "" ,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () {
                    if(FirebaseAuth != null && FirebaseAuth.instance != null){
                      FirebaseAuth.instance!.signOut().then((value) {
                        Navigator.of(context).pushReplacementNamed('/login');
                        // Navigate to login screen after successful logout
                      }).catchError((e) {
                        print(e);
                        // Handle error if logout fails
                      });
                    }

                  }, child: const Text("logout")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
