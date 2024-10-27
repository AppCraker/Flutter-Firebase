import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/screens/login/loginpage.dart';
import 'package:testingapp/screens/posts/add_posts.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Loginpage()));
              }).onError((error, stackTrace) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              });
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text("Your content goes here"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
