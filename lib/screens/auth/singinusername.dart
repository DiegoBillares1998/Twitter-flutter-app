import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:twitter/services/auth.dart';

class SignInUsername extends StatefulWidget {
  SignInUsername({Key? key}) : super(key: key);

  @override
  _SignInUsernameState createState() => _SignInUsernameState();
}

class _SignInUsernameState extends State<SignInUsername> {
  final AuthService _authService = AuthService();
  String emailOrPhoneNumber = '';

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
                child: Text(
                    'To get started, first enter your phone, email, or @username',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
              ),
              Padding(padding: const EdgeInsets.only(top: 10)),
              TextFormField(
                style: TextStyle(color: Colors.white),
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
              Padding(padding: const EdgeInsets.only(top: 330)),
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
                          _authService.saveUserName(emailOrPhoneNumber),
                          Navigator.pushNamed(context, '/signinpassword')
                        }),
              ),
            ],
          )),
        ));
  }
}
