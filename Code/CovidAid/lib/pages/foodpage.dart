import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  final snackBar = SnackBar(content: Text('ADDED INFO'));

  final TextEditingController _people = new TextEditingController();
  final TextEditingController _location = new TextEditingController();

  final db = Firestore.instance;
  DocumentReference documentReference;
  bool needfood = false;
  bool needShelter = false;
  Position position;

  static int k=0;

  getCurrentLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    position = await geolocator.getCurrentPosition();
    print(position);
  }

  void add() {
    Details details = new Details();
    details.number = _people.text;
    details.location = _location.text;
    details.criticality = crit;
    details.needFood = needfood;
    details.needShelter = needShelter;
    details.latitude = position.latitude.toString();
    details.longitude = position.longitude.toString();
    k++;
    documentReference = Firestore.instance.document("mydata/"+k.toString());
    documentReference.setData(details.toJson()).whenComplete((){
      print('Done $k');
    }).catchError((e) => print(e));
  }

  bool done = false;

  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              InputWidget(
                controller: _people,
                label: 'Number of People: ',
                hint: 'Enter a number',
                maxlines: 1,
                maxlength: 5,
                keyboardtype: TextInputType.number,
              ),
              InputWidget(
                controller: _location,
                label: 'Location: ',
                hint: 'Enter location',
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
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: needfood,
                      onChanged: (value) {
                        setState(() {
                          needfood = !needfood;
                        });
                      },
                    ),
                    Text('Food'),
                    Spacer(),
                    Checkbox(
                      value: needShelter,
                      onChanged: (value) {
                        setState(() {
                          needShelter = !needShelter;
                        });
                      },
                    ),
                    Text('Shelter'),                    
                  ],
                ),
              ),
              SizedBox(height: 40.0),
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
                onChanged: (value) {
                  controller.text = value;
                },
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
  String location;
  String criticality;
  String latitude;
  String longitude;
  bool needFood;
  bool needShelter;

  Details({this.number, this.location, 
  this.criticality, this.latitude, this.longitude});

  Map<String, dynamic> toJson() =>
  {
    'number': number,
    'location': location,
    'criticality' : criticality,
    'latitude' : latitude,
    'longitide' : longitude,
    'food' : needFood,
    'shelter' : needShelter
  };
}

class NeedOptions extends StatefulWidget {

  @override
  _NeedOptionsState createState() => _NeedOptionsState();
}

enum Criticality { basic, mild, severe }
String crit  = 'Basic';

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

