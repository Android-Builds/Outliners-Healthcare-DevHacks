import 'package:CovidAid/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:CovidAid/widgets/header.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Header(),
//          _createDrawerItem(
//            icon: Icons.wb_sunny,
//            text: 'Home',
//            onTap: (){
//              DynamicTheme.of(context).setBrightness(
//                  Theme.of(context).brightness == Brightness.dark
//                      ? Brightness.light
//                      : Brightness.dark);
//            },
//          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage())),
          ),
          // All other Options to go here Debjit Bro
          Divider(),
          _createDrawerItem(icon: Icons.face, text: 'Account'),
          _createDrawerItem(icon: Icons.favorite_border, text: 'Donate'),
          Divider(),
          _createDrawerItem(icon: Icons.rate_review, text: 'Report'),
          Divider(),
          Row(
            children: <Widget>[
              SizedBox(width: 20,),
              Text("Made with"),
              Image(
                image: AssetImage("assets/heart.png"),
                width: 30,
                height: 30,
              ),
              SizedBox(width: 2,),
              Text("By Outliners",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.blue),)
            ],
          ),
        ],
      ),
    );
  }
}
