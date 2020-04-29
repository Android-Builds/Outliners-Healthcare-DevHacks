import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              InputWidget(
                label: 'Number of People:',
                hint: 'Enter a number',
                maxlines: 1,
              ),
              InputWidget(
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
            ],
          ),
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key key, this.label, this.hint, this.maxlines,
  }) : super(key: key);

  final String label;
  final String hint;
  final int maxlines;

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