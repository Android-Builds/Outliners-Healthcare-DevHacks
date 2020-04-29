import 'package:CovidAid/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:enum_to_string/enum_to_string.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  final snackBar = SnackBar(content: Text('ADDED INFO'));

  final TextEditingController _people = new TextEditingController();
  final TextEditingController _controller = new TextEditingController();


  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  final Firestore _db = Firestore.instance;

  @override
  void initState() {
    getUid();
    // TODO: implement initState
    super.initState();
  }

  void getUid() async {
    FirebaseUser u = await _auth.currentUser();
    setState(() {
      user = u;
    });
  }

  bool done = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InputWidget(
              controller: _people,
              label: 'Number of People:',
              hint: 'Enter a number',
              maxlines: 1,
            ),
            InputWidget(
              controller: _controller,
              label: 'Address:',
              hint: 'Enter address',
              maxlines: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: <Widget>[
                  Text('Criticality: '),
                  SizedBox(width: 20.0),
                  Flexible(child: NeedOptions())
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: RaisedButton(
                  onPressed: (){

                    String people = _people.text.trim();
                    String add = _controller.text.trim();

                    _db.collection("users").document(user.uid)
                      ..collection("Food").add({
                        "people": people,
                        "address": add,
                      });

                    _people.clear();
                    _controller.clear();

                    

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Homepage()));

                    //Scaffold.of(context).showSnackBar(snackBar);

                  },
                  child: Text("ADD INFO"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {

  final String label;
  final String hint;
  final int maxlines;
  final TextEditingController controller;

  InputWidget({
    Key key, this.label, this.hint, this.maxlines,this.controller
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 15.0
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Container(
              height: maxlines * 40.0,
              child: TextField(
                controller: controller,
                maxLines: maxlines,
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: InputBorder.none,
                  hintText: hint
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NeedOptions extends StatefulWidget {

//  final String val;
//  int index;
//
//  val = Criticality.values[index];
//
//  NeedOptions({this.val});

  @override
  _NeedOptionsState createState() => _NeedOptionsState();
}

enum Criticality { basic, mild, severe }

class _NeedOptionsState extends State<NeedOptions> {

  Criticality _character = Criticality.basic;

  main() {
    // Parse enum to a string
    EnumToString.parse(Criticality.basic); //ValueOne
    EnumToString.parse(Criticality.mild); //Value2
    EnumToString.parse(Criticality.severe); //valueThree

    // Parse an enum to something more human readable
    EnumToString.parseCamelCase(Criticality.basic); //Value one
    EnumToString.parseCamelCase(Criticality.mild); //Value 2
    EnumToString.parseCamelCase(Criticality.severe); //Value three

    // Get an enum from a string
    EnumToString.fromString(Criticality.values, "basic"); //, TestEnum.ValueOne
    EnumToString.fromString(Criticality.values, "mild"); // TestEnum.Value2
    EnumToString.fromString(Criticality.values, "severe"); // TestEnum.valueThree

    // Get an enum from a string
    EnumToString.toList<Criticality>(
        Criticality.values); // {ValueOne, Value2, valuethree}
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Basic'),
          leading: Radio(
            value: Criticality.basic,
            groupValue: _character,
            onChanged: (Criticality value) {
              setState(() { _character = value; });
            },
          ),
        ),
        ListTile(
          title: const Text('Mild'),
          leading: Radio(
            value: Criticality.mild,
            groupValue: _character,
            onChanged: (Criticality value) {
              setState(() { _character = value; });
            },
          ),
        ),
        ListTile(
          title: const Text('Severe'),
          leading: Radio(
            value: Criticality.severe,
            groupValue: _character,
            onChanged: (Criticality value) {
              setState(() { _character = value; });
            },
          ),
        ),
      ],
    );
  }

//  _showList(){
//      return ListTile(
//        title: const Text('Mild'),
//        leading: Radio(
//          value: Criticality.values[index],
//          groupValue: _character,
//          onChanged: (Criticality value) {
//            setState(() { _character = value; });
//          },
//        ),
//      );
//  }
}

