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
  String name = '';
  String emailOrPhoneNumber = '';
  String birthDay = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.blue),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Icon(EvaIcons.twitter, color: Colors.blue)),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: new Form(
              child: Column(
            children: [
              Align(
                alignment: FractionalOffset.topLeft,
                child: Text('Create your account',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
              ),
              Padding(padding: const EdgeInsets.only(top: 80)),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    )),
                onChanged: (val) => setState(() {
                  name = val;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Phone number or email",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    )),
                onChanged: (val) => setState(() {
                  emailOrPhoneNumber = val;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Day of birth",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    )),
                onChanged: (val) => setState(() {
                  birthDay = val;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    )),
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              Padding(padding: const EdgeInsets.only(top: 160)),
              Align(
                alignment: FractionalOffset.bottomRight,
                child: ElevatedButton(
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, //background color of button
                      side: BorderSide(
                          width: 3,
                          color: Colors.blue), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(
                              30)), //content padding inside button
                    ),
                    onPressed: () async => {
                          _authService.CreateAccount(
                              name, emailOrPhoneNumber, birthDay, password)
                        }),
              ),
            ],
          )),
        ));
  }
}
