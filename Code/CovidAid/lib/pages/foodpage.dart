import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  bool needfood = false;
  bool needShelter = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                InputWidget(
                  label: 'Number of People:',
                  hint: 'Enter a number',
                  maxlines: 1,
                  maxlength: 5,
                  keyboardtype: TextInputType.number,
                ),
                InputWidget(
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
                  onPressed: () {},
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
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key key, this.label, this.hint, 
    this.maxlines, this.maxlength, 
    this.keyboardtype,
  }) : super(key: key);

  final String label;
  final String hint;
  final int maxlines;
  final int maxlength;
  final TextInputType keyboardtype;

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

class NeedOptions extends StatefulWidget {
  @override
  _NeedOptionsState createState() => _NeedOptionsState();
}

enum Criticality { basic, mild, severe }

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
}