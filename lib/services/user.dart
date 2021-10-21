import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter/models/user.dart';

class UserService {
  UserModel? _userFromFirebaseSnapshot(DocumentSnapshot snapshot) {
    return snapshot != null
        ? UserModel(
            id: snapshot.id,
            name: snapshot['name'],
            phoneNumber: snapshot['phoneNumber'],
            email: snapshot['email'],
            birthDay: snapshot['birthDay'],
            password: snapshot['password'])
        : null;
  }

  Stream<UserModel?> getUserInfo(uid) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots()
        .map(_userFromFirebaseSnapshot);
  }
}
