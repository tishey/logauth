import 'package:firebase_core/firebase_core.dart';
import '../shared/constant/constants.dart';
import '../screens/login.dart';
import 'package:flutter/material.dart';
import '../shared/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  final _auth = FirebaseAuth.instance;
  Firebase? loggedInUser;


  @override
  void initState() {
    super.initState();
  getCurrentUser();
  }

  void getCurrentUser() async {
    try{
      final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user as Firebase?;
      print(loggedInUser);
    }
    }
    catch (e){
      print(e);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwColour,
        body: Center(
            child: SButton(
              onTapped:  (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
          slabel: 'Login Successfully', )));
  }
}





