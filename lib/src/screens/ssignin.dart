// import '../constant/constants.dart';
import '../screens/login.dart';
import 'package:flutter/material.dart';
import '../shared/widget/button.dart';

class SignupSuccess extends StatelessWidget {
  const SignupSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(2),
        body: Center(
            child: SButton(
              onTapped:  (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
          slabel: 'Signup Successfully', )));
  }
}



