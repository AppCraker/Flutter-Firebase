import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testingapp/screens/posts/post_screen.dart';
import 'package:testingapp/widget/roundbutton.dart';

class Verifyphone extends StatefulWidget {
  String verificationId;
  Verifyphone({super.key, required this.verificationId});

  @override
  State<Verifyphone> createState() => _VerifyphoneState();
}

class _VerifyphoneState extends State<Verifyphone> {
  @override
  bool loading = false;
  final verifyCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80,),
            TextFormField(
                controller: verifyCodeController,
                decoration: InputDecoration(
                  hintText: "6 - digit code"
                ),
            ),
            SizedBox(
              height: 80,
            ),
            Roundbutton(
              title: "Login", 
              onTap: ()async{
                setState(() {
                  loading = true;
                });
                final credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: verifyCodeController.text.toString());
                try {
                  await auth.signInWithCredential(credential);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));

                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  
                }
              }
              )
        
          ],
        ),
      ),
    );
  }
}