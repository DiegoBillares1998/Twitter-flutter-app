import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/models/userlog.dart';
import 'package:twitter/screens/auth/signinpassword.dart';
import 'package:twitter/screens/auth/signup.dart';
import 'package:twitter/screens/auth/singinusername.dart';
import 'main/home.dart';
import 'main/posts/Add.dart';
import 'main/welcome.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserLog?>(context);

    if (user != null) {
      return Home();
    }

    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Welcome(),
      '/signinpassword': (context) => SignInPassword(),
      '/signinusername': (context) => SignInUsername(),
      '/signup': (context) => SignUp(),
    });
  }
}
