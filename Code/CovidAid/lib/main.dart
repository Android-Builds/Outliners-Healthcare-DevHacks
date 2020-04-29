import 'package:CovidAid/pages/google_signin.dart';
import 'package:CovidAid/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Main()
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  final FirebaseAuth _auth = FirebaseAuth.instance;



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Awesome StreamBuilder

    return StreamBuilder(
      stream: _auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot){
        if(snapshot.hasData){
          FirebaseUser user = snapshot.data;
          if(user!=null){
            return Homepage();
          }
          else{
            return SignInScreen();
          }
        }
        return SignInScreen();
      },
    );
  }
}
