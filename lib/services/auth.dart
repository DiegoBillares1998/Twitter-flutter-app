import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/models/userlog.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  LocalStorage storage = new LocalStorage('username');

  void saveUserName(String username) {
    storage.setItem('username', username);
  }

  UserLog? _userFromFirebaseUser(User user) {
    return user != null ? UserLog(id: user.uid) : null;
  }

  Stream<UserLog> get user {
    return auth
        .authStateChanges()
        .map((user) => _userFromFirebaseUser(user as User) as UserLog);
  }

  Future SignIn(password) async {
    try {
      User user = null as User;
      storage.getItem('username').contains('@')
          ? user = await auth.signInWithEmailAndPassword(
              email: storage.getItem('username'), password: password) as User
          : user = await auth.signInWithEmailAndPassword(
              email: storage.getItem('username') + "@mail.com",
              password: password) as User;
      _userFromFirebaseUser(user);
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
      !emailOrPhoneNumber.contains('@')
          ? await auth.createUserWithEmailAndPassword(
              email: emailOrPhoneNumber + "@mail.com", password: password)
          : await auth.createUserWithEmailAndPassword(
              email: emailOrPhoneNumber, password: password);
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
