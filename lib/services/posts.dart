import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitter/models/posts.dart';

class PostService {
  List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel(
          id: doc.id,
          email: doc['email'] ?? '',
          image: doc['image'] ?? '',
          time: doc['time'] ?? '',
          text: doc['text'] ?? '',
          comments: doc['comments'] ?? '0',
          reTweets: doc['reTweets'] ?? '0',
          likes: doc['likes'] ?? '0');
    }).toList();
  }

  Future savePost(email, image, time, text, comments, reTweets, likes) async {
    await FirebaseFirestore.instance.collection("posts").add({
      'email': email,
      'image': image,
      'time': time,
      'text': text,
      'comments': comments,
      'reTweets': reTweets,
      'likes': likes
    });
  }

  Future<List<PostModel>>? getPosts() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('posts').get();

    return _postListFromSnapshot(querySnapshot);
  }
}
