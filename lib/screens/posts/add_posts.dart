import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/widget/roundbutton.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}



class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final postcontroller = new TextEditingController();
  final DatabaseReference = FirebaseDatabase.instance.ref("Post");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
        
            TextFormField(
              controller: postcontroller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "what's your post",
                border: OutlineInputBorder(
                  
                )
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Roundbutton(
              
              title: "Add",
               onTap: (){
                setState(() {
                  loading = true;
                });
                  DatabaseReference.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                    "id":  DateTime.now().millisecondsSinceEpoch.toString(),
                    "title": postcontroller.text.toString()
                  }).then((value) {
                    setState(() {
                  loading = false;
                });
                    ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                         content: Text("Post added"),
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 3),
                                   ),
                                 );
                  }).onError((error,stackTrace){
                    setState(() {
                  loading = false;
                });
                    ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                         content: Text(error.toString()),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 3),
                                   ),
                                 );
                  });
               })
        
          ],
        ),
      ),
    );
  }
}