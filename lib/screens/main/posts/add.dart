import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:twitter/services/posts.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  PostService _postService = PostService();
  String email = '';
  String image = '';
  String time = '';
  String text = '';
  String comments = '';
  String reTweets = '';
  String likes = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Icon(EvaIcons.twitter, color: Colors.blue),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                ),
                onPressed: () async {
                  _postService.savePost(
                      email, image, time, text, comments, reTweets, likes);
                  Navigator.pop(context);
                },
                child: Text('Tweet'))
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: new Form(
                child: Column(children: [
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  }),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Image Url",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  onChanged: (val) {
                    setState(() {
                      image = val;
                    });
                  }),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Last time connection",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  onChanged: (val) {
                    setState(() {
                      time = val;
                    });
                  }),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Text of the user tweet",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  onChanged: (val) {
                    setState(() {
                      text = val;
                    });
                  }),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Number of comments",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (val) {
                    setState(() {
                      comments = val;
                    });
                  }),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Number of re-tweets",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (val) {
                    setState(() {
                      reTweets = val;
                    });
                  }),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Number of likes",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (val) {
                    setState(() {
                      likes = val;
                    });
                  }),
            ]))));
  }
}
