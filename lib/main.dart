import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/screens/wrapper.dart';
import 'package:twitter/services/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        //if (snapshot.hasError) {
        // return SomethingWentWrong();
        //}

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<UserModel>.value(
            value: AuthService().user,
            initialData: new UserModel(id: "0"),
            child: MaterialApp(home: Wrapper()),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Loading");
      },
    );
  }
}
