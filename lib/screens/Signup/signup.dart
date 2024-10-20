import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/screens/login/widgets/inputform.dart';
import 'package:testingapp/widget/roundbutton.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool loading = false;
  final emailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void signup(){
      setState(() {
                    loading = true;
                  });
                  if (_formkey.currentState!.validate()) {
                    _auth.createUserWithEmailAndPassword(
                      email: emailcontroller.text.toString(), 
                      password: passwordcontroller.text.toString()).then((value) {

                        
                        setState(() {
                          loading = false;
                        });

                       if (mounted) {
          // Show success message using SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
              content: Text("Sign-up successful"),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
                        
                      },onError: ((error,stackTrace){
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
                      }));
                  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up", style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.deepPurple,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                child: Column( 
                  children: [
                    InputfieldForm(
                      obscure: false,
                      helpertxt: "john@gmail.com",
                      controller: emailcontroller, 
                      valuetxt: "email",
                       icon: Icon(Icons.email_outlined), 
                       validatetxt: 'Enter Email',
                      
                       ),


                   const SizedBox(height: 20,),
                
                
               InputfieldForm(
                obscure: true,
                controller: passwordcontroller,
                 valuetxt: "Enter password",
                  icon: const Icon(Icons.password_outlined),
                   helpertxt: 'pass@123', 
                   validatetxt: 'Enter Password',
                )
                  ],
                ) 
                ),
              

              Roundbutton(
                loading: loading,
                title: "Sign Up",
                 onTap: (){
                   signup();
                 }
                 ), 


                const SizedBox(height: 20,),       
            ],
          ),
        ),
      ),
    );
  }
}