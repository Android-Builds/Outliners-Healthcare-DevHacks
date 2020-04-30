import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  final snackBar = SnackBar(content: Text('ADDED INFO'));

  final TextEditingController _people = new TextEditingController();
  final TextEditingController _address = new TextEditingController();

  final db = Firestore.instance;
  DocumentReference documentReference;

  static int k=0;

  void add() {
    Details details = new Details();
    details.number = _people.text;
    details.address = _address.text;
    details.criticality = crit;
    k++;
    documentReference = Firestore.instance.document("mydata/"+k.toString());
    documentReference.setData(details.toJson()).whenComplete((){
      print('Done $k');
    }).catchError((e) => print(e));
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
              maxlength: 5,
            ),
            InputWidget(
              controller: _address,
              label: 'Address:',
              hint: 'Enter address',
              maxlines: 3,
              maxlength: 1000,
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
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                add();
                Navigator.pop(context);
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),
              ),
              minWidth: 300.0,
              height: 60.0,
            )
          ],
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key key, this.label, this.hint, 
    this.maxlines, this.maxlength, 
    this.keyboardtype, this.controller,
  }) : super(key: key);

  final String label;
  final String hint;
  final int maxlines;
  final int maxlength;
  final TextInputType keyboardtype;
  final TextEditingController controller;

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
              height: maxlines * 60.0,
              child: TextField(
                keyboardType: keyboardtype,
                maxLines: maxlines,
                maxLength: maxlength,
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

class Details {
  String number;
  String address;
  String criticality;
  String latitude;
  String longitude;

  Details({this.number, this.address, 
  this.criticality, this.latitude, this.longitude});

  Map<String, dynamic> toJson() =>
  {
    'number': number,
    'address': address,
    'criticality' : criticality,
    'latitude' : latitude,
    'longitide' : longitude
  };
}

class NeedOptions extends StatefulWidget {

  @override
  _NeedOptionsState createState() => _NeedOptionsState();
}

enum Criticality { basic, mild, severe }
String crit;

class _NeedOptionsState extends State<NeedOptions> {

  Criticality _character = Criticality.basic;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Basic'),
          leading: Radio(
            value: Criticality.basic,
            groupValue: _character,
            onChanged: (Criticality value) {
              setState(() { 
                _character = value;
                crit = 'Basic';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mild'),
          leading: Radio(
            value: Criticality.mild,
            groupValue: _character,
            onChanged: (Criticality value) {
              setState(() {
                _character = value;
                crit = 'Mild';
                });
            },
          ),
        ),
        ListTile(
          title: const Text('Severe'),
          leading: Radio(
            value: Criticality.severe,
            groupValue: _character,
            onChanged: (Criticality value) {
              setState(() {
                _character = value;
                crit = 'Severe';
              });
            },
          ),
        ),
      ],
    );
  }
}

