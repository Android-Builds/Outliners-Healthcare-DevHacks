import 'package:CovidAid/drawer/drawer.dart';
import 'package:CovidAid/model/ngo_list.dart';
import 'package:CovidAid/model/ngo_model.dart';
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

  List<NGO> ngo;

  @override
  void initState() {
    super.initState();
    ngo = getNGO();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
          elevation: 0.0,
          title: Text(
            "CovidAid",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    _auth.signOut();
                  },
                  child: Icon(
                    Icons.call_missed_outgoing,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FoodPage())),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.black)),
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
                                  fontWeight: FontWeight.bold, fontSize: 30.0),
                            ),
                            Image.network(
                                'http://getdrawings.com/free-icon-bw/food-icon-transparent-17.png')
                          ],
                        )),
                  ),
                ),
                SizedBox(width: 20.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShelterPage()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.black)),
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
                                fontWeight: FontWeight.bold, fontSize: 30.0),
                          ),
                          Image.network(
                              'https://i.ya-webdesign.com/images/volume-bar-png-6.png')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("NGO's Available",style: TextStyle(fontSize: 20,color: Colors.blue),),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: ngo.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.white,
                            child: ListTile(
                              isThreeLine: true,
                              trailing: Icon(Icons.phone,color: Colors.green,),
                              title: Text(ngo[index].name),
                              subtitle: Text(
                                  "state: ${ngo[index].state} \ncontact: ${ngo[index].contact}"),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
//
          ],
        ),
      ),
    );
  }
}
