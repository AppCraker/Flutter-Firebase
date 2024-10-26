import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testingapp/screens/login/auth/verifyphone.dart';
import 'package:testingapp/widget/roundbutton.dart';

class Loginwihphoneno extends StatefulWidget {
  const Loginwihphoneno({super.key});

  @override
  State<Loginwihphoneno> createState() => _LoginwihphonenoState();
}

class _LoginwihphonenoState extends State<Loginwihphoneno> {
  bool loading = false;
  final phonenumber_controller = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80,),
            TextFormField(
                controller: phonenumber_controller,
                decoration: InputDecoration(
                  hintText: "8562354787"
                ),
            ),
            SizedBox(
              height: 80,
            ),
            Roundbutton(
              title: "Login", 
              onTap: (){
                auth.verifyPhoneNumber(
                  phoneNumber: phonenumber_controller.text,
                  verificationCompleted: (_){

                  }  ,
                   verificationFailed:(e){
                    ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                         content: Text(e.toString()),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 3),
                                   ),
                                 );
                   },
                    codeSent: (String verificationId, int? token){
                       Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context)=>Verifyphone(verificationId:verificationId ,)));

                    },
                    codeAutoRetrievalTimeout: (e){
                      ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                         content: Text(e.toString()),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 3),
                                   ),
                                 );
                    }
                    );
              })
        
          ],
        ),
      ),
    );
  }
}