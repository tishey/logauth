// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:logauth/src/services/auth.dart';
import 'package:logauth/src/shared/widget/validate/textfield.dart';

import '../shared/constant/constants.dart';
import '../screens/slogin.dart';
// import '../screen/ssignin.dart';
import '../shared/widget/button.dart';
import 'package:flutter/material.dart';
// import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = '';
  String email = '';
  String password = '';
  String error = '';

 // final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: kbColour,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: titleText1,
            ),
            Text('glad to see you!',
                style: TextStyle(fontSize: 18, color: Colors.grey[500])),
            SizedBox(
              height: 25,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  LogAuthTextField(
                    labelText: 'Name',
                    onChanged: (value) => setState(
                      () {
                        value = name;
                      },
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter name' : null,
                    color: Colors.white,
                    borderSideColor: Colors.grey.withOpacity(0.7),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  LogAuthTextField(
                    labelText: 'Email',
                    borderSideColor: Colors.grey.withOpacity(0.7),
                    color: Colors.white,
                    onChanged: (value) => setState(() {
                      value = email;
                    }),
                    validator: (value) => value!.isEmpty ? 'Enter email' : null,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  LogAuthTextField(
                    color: Colors.white,
                    borderSideColor:  Colors.grey.withOpacity(0.7),
                    labelText: 'Password', onChanged: (value) => setState((){
                    value = password;
                  }), 
                  validator: (value) => value?.length != null ? 'character must be 6 or above' : null,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
                onTap: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   dynamic result = await _auth.signUp(email, password);
                  //   if (result == null) {
                  //     setState(() {
                  //       error = 'Please enter valid email';
                  //     });
                  //   }
                  // }
                  // print(name);
                  // print(email);
                  // print(password);
                  // //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSuccess(),),);
                },
                child: LabelButton(
                  colour: Colors.white,
                  labelText: 'Create account',
                  cStyle: Colors.black,
                )),
            Text(
              error,
              style: TextStyle(fontSize: 16, color: Colors.red),
            )
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Stack(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
              right: 30,
              child: Container(
                padding: EdgeInsets.all(5),
                height: 60,
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.black),
              ))
        ],
      ),
    );
  }
}
