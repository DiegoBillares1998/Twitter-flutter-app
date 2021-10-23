import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

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
                child: Column(children: [
              Padding(padding: const EdgeInsets.only(top: 180)),
              Align(
                alignment: FractionalOffset.center,
                child: Text("See what's happening in the world right now",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
              ),
              Padding(padding: const EdgeInsets.only(top: 150)),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                    child: Icon(
                      EvaIcons.google,
                      color: Colors.blue,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, //background color of button
                        side: BorderSide(
                            width: 3,
                            color: Colors.white), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.fromLTRB(80, 13, 195, 13)
                        //content padding inside button
                        ),
                    onPressed: () async =>
                        {Navigator.pushNamed(context, '/signinusername')}),
              ),
              Padding(padding: const EdgeInsets.only(top: 15)),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                    child: Text("Create account"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, //background color of button
                      side: BorderSide(
                          width: 3,
                          color: Colors.blue), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 100), //content padding inside button
                    ),
                    onPressed: () async =>
                        {Navigator.pushNamed(context, '/signup')}),
              )
            ]))));
  }
}
