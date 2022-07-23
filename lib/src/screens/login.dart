// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../shared/constant/constants.dart';
import '../screens/signup.dart';
import '../screens/slogin.dart';
import 'package:flutter/material.dart';
import '../shared/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '../widget/bottombar.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String email = '';
  String password = '';

  
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: titleText,
              ),
              Text('glad to see you!',
                  style: TextStyle(fontSize: 18, color: Colors.grey[500])),
              SizedBox(
                height: 25,
              ),
              Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    validator: (value) => value!.isEmpty ? 'Enter Email' : null,
                controller: emailController,
                onChanged: (value) {
                setState(() {
                  email = value;
                });
                  //emailController.text = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              TextFormField(
                validator: (value) => value!.length < 6 ? 'Enter up-to 6 character' : null,
                controller: passwordController,
                onChanged: (value) {
                setState(() {
                  password = value;
                });
                  //emailController.text = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              )
              ],)),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      print(email);
                      print(password);
                     
                    }
                    // loginUser(emailController.text, passwordController.text);
                    // print(loginUser);
                    },
              
                child: LabelButton(
                  colour: Colors.black,
                  labelText: 'Login',
                  cStyle: Colors.white,
                ),
              )
            ],
          )),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if(_formKey.currentState!.validate()){
            print(email);
            print(password);
          }
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => SignupPage()));
        },
        child: Stack(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text(
                  'Create account',
                  style: TextStyle(
                      color: Colors.white,
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
                    color: Colors.black,
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.white),
                ))
          ],
        ));
  }

  void loginUser(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
      .then((uid) => {
        Fluttertoast.showToast(msg: 'Login successful'),
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginSuccess()))
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
      
    }
  }
}
