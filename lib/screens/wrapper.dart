import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/user.dart';

import 'auth/singUp.dart';
import 'main/home.dart';
import 'main/posts/Add.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    if (user == null) {
      return SignUp();
    }

    return MaterialApp(
        initialRoute: '/',
        routes: {'/': (context) => Home(), '/add': (context) => Add()});

    return Home();
  }
}
