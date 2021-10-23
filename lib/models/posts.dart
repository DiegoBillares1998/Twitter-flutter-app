import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String email;
  final String image;
  final String time;
  final String text;
  final String comments;
  final String reTweets;
  final String likes;

  PostModel(
      {required this.id,
      required this.email,
      required this.image,
      required this.time,
      required this.text,
      required this.comments,
      required this.reTweets,
      required this.likes});
}
