import 'dart:ui';

import 'package:CovidAid/model/adapterShelter.dart';
import 'package:CovidAid/model/shelter_info.dart';
import 'package:flutter/material.dart';

class ShelterPage extends StatefulWidget {
  @override
  _ShelterPageState createState() => _ShelterPageState();
}

class _ShelterPageState extends State<ShelterPage> {
  List<Shelter_Info> shelter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    shelter = getShelter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Shelter"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Locations Available",style: TextStyle(fontSize: 30),),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  child: ListView.builder(
                      itemCount: shelter.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.black)
                          ),
                          child: Container(
                            width: 100,
                            height: 200,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  shelter[index].location,
                                  style: TextStyle(color: Colors.black, fontSize: 15),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                    child: Image.asset(
                                      shelter[index].image,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Fill Form",style: TextStyle(fontSize: 30),),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
