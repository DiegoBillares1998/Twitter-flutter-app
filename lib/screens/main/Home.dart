import 'package:flutter/material.dart';
import 'package:twitter/services/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Icon(EvaIcons.twitter, color: Colors.blue)),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TextButton(
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
            onPressed: () {
              _authService.signOut();
            },
            child: const Text('SignOut'),
          ),
        ])));
  }
}
