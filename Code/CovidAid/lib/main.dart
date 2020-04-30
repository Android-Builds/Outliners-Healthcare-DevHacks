import 'package:CovidAid/pages/google_signin.dart';
import 'package:CovidAid/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var rememberMe = prefs.getBool('rememberMe');
  print(rememberMe);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: rememberMe == null || rememberMe == false ? SignInScreen() : Homepage()
    )
  );
}