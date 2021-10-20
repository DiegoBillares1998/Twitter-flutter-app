import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:twitter/services/auth.dart';

class SignUp extends StatefulWidget {
  SignUp() : super();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Icon(EvaIcons.twitter, color: Colors.blue)),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: new Form(
              child: Column(
            children: [
              TextFormField(
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),
              TextFormField(
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              Padding(padding: const EdgeInsets.only(top: 200.0)),
              ElevatedButton(
                  child: Text('Signup'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent, //background color of button
                    side: BorderSide(
                        width: 3, color: Colors.brown), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 133), //content padding inside button
                  ),
                  onPressed: () async =>
                      {_authService.SignUp(email, password)}),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              ElevatedButton(
                  child: Text('Signin'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent, //background color of button
                      side: BorderSide(
                          width: 3,
                          color: Colors.brown), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 135) //content padding inside button
                      ),
                  onPressed: () async =>
                      {_authService.SignIn(email, password)}),
            ],
          )),
        ));
  }
}
