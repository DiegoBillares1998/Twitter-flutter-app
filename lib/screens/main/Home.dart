import 'package:flutter/material.dart';
import 'package:twitter/screens/home/email.dart';
import 'package:twitter/screens/home/feed.dart';
import 'package:twitter/screens/home/search.dart';
import 'package:twitter/screens/home/advices.dart';
import 'package:twitter/screens/main/posts/add.dart';
import 'package:twitter/services/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    int _currentIndex = 0;
    final List<Widget> _children = [Feed(), Search(), Advice(), Email()];

    void onTabPressed(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.grey),
            backgroundColor: Colors.white,
            centerTitle: true,
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.white,
                    onSurface: Colors.white,
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.star_border_purple500,
                    color: Colors.blue,
                  ))
            ],
            title: Icon(EvaIcons.twitter, color: Colors.blue)),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add()),
              );
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
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTabPressed,
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: new Icon(
                    EvaIcons.home,
                    color: Colors.black,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: new Icon(
                    EvaIcons.search,
                    color: Colors.black,
                  ),
                  label: 'search'),
              BottomNavigationBarItem(
                  icon: new Icon(
                    EvaIcons.bellOutline,
                    color: Colors.black,
                  ),
                  label: 'notifications'),
              BottomNavigationBarItem(
                  icon: new Icon(
                    EvaIcons.email,
                    color: Colors.black,
                  ),
                  label: 'email'),
            ]),
        body: _children[_currentIndex]);
  }
}
