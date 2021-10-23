import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:twitter/services/auth.dart';

class SignInPassword extends StatefulWidget {
  SignInPassword({Key? key}) : super(key: key);

  @override
  _SignInPasswordState createState() => _SignInPasswordState();
}

class _SignInPasswordState extends State<SignInPassword> {
  final AuthService _authService = AuthService();
  String password = '';
  bool _isObscure = true;

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
                child: Text('Enter your password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
              ),
              Padding(padding: const EdgeInsets.only(top: 10)),
              TextFormField(
                obscureText: _isObscure,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    )),
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              Padding(padding: const EdgeInsets.only(top: 390)),
              Align(
                alignment: FractionalOffset.bottomRight,
                child: ElevatedButton(
                    child: Text('Log in'),
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
                    onPressed: () async => {_authService.SignIn(password)}),
              ),
            ],
          )),
        ));
  }
}
