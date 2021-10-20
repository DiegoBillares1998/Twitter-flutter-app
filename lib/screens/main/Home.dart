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
            iconTheme: IconThemeData(color: Colors.grey),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Icon(EvaIcons.twitter, color: Colors.blue)),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            child: Icon(Icons.add)),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            DrawerHeader(
              child: Icon(EvaIcons.twitter, color: Colors.blue, size: 50),
              decoration: BoxDecoration(color: Colors.white),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                _authService.signOut();
              },
            ),
          ]),
        ));
  }
}
