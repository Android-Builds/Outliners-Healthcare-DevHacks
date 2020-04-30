import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: Stack(children: <Widget>[
          Positioned(
            left: 16.0,
            bottom: 55.0,
            child: Text("v1.0.0",style: TextStyle(color: Colors.redAccent,wordSpacing: 2,fontSize: 15,fontWeight: FontWeight.w300),),
          ),
          Positioned(
              bottom: 22.0,
              left: 16.0,
              child: Text("Covid Aid",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.0,
                      fontWeight: FontWeight.w300))),
          Positioned(
              bottom: 7.0,
              left: 16.0,
              child: Text("Made for Dev Hack Hackathon",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300)))
        ]));
    ;
  }
}
