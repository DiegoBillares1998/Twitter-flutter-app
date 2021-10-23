import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/posts.dart';
import 'package:twitter/services/posts.dart';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<PostModel>>(
      create: (_) => _postService.getPosts(),
      initialData: [],
      child: Consumer<List<PostModel>>(builder: (context, items, _) {
        return items == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  var itemEmail = item.email;
                  List<String> parseString = itemEmail.split('@');

                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Row(
                              children: [
                                item.image != ''
                                    ? CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            NetworkImage(item.image))
                                    : Icon(Icons.person, size: 40),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Column(children: [
                                      Container(
                                          child: Row(children: [
                                        Text(parseString[0]),
                                        Text('@' + parseString[1],
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text('.' + item.time,
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ])),
                                      Container(
                                          child: Text(
                                        item.text,
                                      )),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(EvaIcons.messageCircleOutline),
                                            Text(item.comments),
                                            Text('            '),
                                            Icon(EvaIcons.repeatOutline),
                                            Text(item.reTweets),
                                            Text('            '),
                                            Icon(EvaIcons.heartOutline),
                                            Text(item.likes),
                                            Text('            '),
                                            Icon(Icons.file_upload_outlined)
                                          ],
                                        ),
                                      ),
                                    ])),
                              ],
                            )),
                      ],
                    ),
                  );
                },
              );
      }),
    );
  }
}
