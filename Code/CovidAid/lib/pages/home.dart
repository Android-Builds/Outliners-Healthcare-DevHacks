import 'package:CovidAid/pages/foodpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodPage())),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    elevation: 10.0,
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      height: 150.0,
                      width: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Food',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0
                            ),
                          ),
                          Image.network('http://getdrawings.com/free-icon-bw/food-icon-transparent-17.png')
                        ],
                      )
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  elevation: 10.0,
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    height: 150.0,
                    width: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Shelter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0
                          ),
                        ),
                        Image.network('https://i.ya-webdesign.com/images/volume-bar-png-6.png')
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}