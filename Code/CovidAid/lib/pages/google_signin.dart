import 'package:CovidAid/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final Firestore _db = Firestore.instance;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return googleSignIn != null ? Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                'CovidAid',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image: new DecorationImage(image: AssetImage("assets/mian.jpg"),colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                      BlendMode.dstATop),fit: BoxFit.cover)
              ),
            ),
            Positioned(
              bottom: 30,
              left: 50,
              right: 50,
              child: InkWell(
                onTap: (){
                  signIn().whenComplete(() async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('rememberMe', true);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 200,
                    height: 50,
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.google),
                        Text("Sign In with Google",style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ): Scaffold(body: Center(child: CircularProgressIndicator(),),) ;
  }

  Future<String> signIn() async{
    try{
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      _db.collection("users").document(user.uid).setData({
        "diaplayName" : user.displayName,
        "photoUrl" : user.photoUrl,
        "email" : user.email,
        "uid" : user.uid,
        "lastSignedIn" : DateTime.now()
      },merge: true);

    }catch(e){
      print(e.message);
    }
    
    return 'signInWithGoogle succeeded';
  }

}
