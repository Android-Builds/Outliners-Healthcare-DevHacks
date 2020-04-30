import 'package:CovidAid/drawer/drawer.dart';
import 'package:CovidAid/pages/foodpage.dart';
import 'package:CovidAid/pages/shelter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
          ),
          elevation: 0.0,
          title: Text("CovidAid",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(onTap: (){
                _auth.signOut();
              },child: Icon(Icons.call_missed_outgoing,color: Colors.white,)),
            ),
            SizedBox(width: 10,)
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodPage())),
              child: Card(
                margin: EdgeInsets.all(20.0),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        size: 30.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Report',
                        style: TextStyle(
                          fontSize: 25.0
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}