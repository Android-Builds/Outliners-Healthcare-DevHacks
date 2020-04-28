import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.orangeAccent
        ),
        child: Stack(children: <Widget>[
          Positioned(
            left: 16.0,
            bottom: 55.0,
            child: Text("v1.0.0",style: TextStyle(color: Colors.redAccent,wordSpacing: 2,fontSize: 20,fontWeight: FontWeight.w300),),
          ),
          Positioned(
              bottom: 22.0,
              left: 16.0,
              child: Text("Public NGO",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 33.0,
                      fontWeight: FontWeight.w300))),
          Positioned(
              bottom: 7.0,
              left: 16.0,
              child: Text("Made for DEVHack Hackathon",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300)))
        ]));
    ;
  }
}
