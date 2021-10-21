import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter/models/user.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(UserModel? user) {
    return user != null
        ? UserModel(
            id: user.id,
            name: user.name,
            birthDay: user.birthDay,
            password: user.password)
        : null;
  }

  Stream<UserModel> get user {
    return auth
        .authStateChanges()
        .map((user) => _userFromFirebaseUser(user as UserModel) as UserModel);
  }

  Future SignIn(email, password) async {
    /*try {
      User user = await auth.createUserWithEmailAndPassword(
          email: email, password: password) as User;
      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }*/
  }

  Future CreateAccount(name, emailOrPhoneNumber, birthDay, password) async {
    try {
      emailOrPhoneNumber.contains('@')
          ? await FirebaseFirestore.instance.collection('users').doc().set({
              'name': name,
              'email': emailOrPhoneNumber,
              'phoneNumber': '',
              'birthDay': birthDay,
              'password': password
            })
          : await FirebaseFirestore.instance.collection('users').doc().set({
              'name': name,
              'email': '',
              'phoneNumber': emailOrPhoneNumber,
              'birthDay': birthDay,
              'password': password
            });
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
