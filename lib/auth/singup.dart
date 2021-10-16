import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  SignUp() : super();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  void SignUpAction() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void SignInAction() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue, elevation: 8, title: Text("Sign Up")),
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
                  onPressed: () async => {SignUpAction()}),
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
                  onPressed: () async => {SignInAction()}),
            ],
          )),
        ));
  }
}
