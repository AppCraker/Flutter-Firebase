import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/screens/Signup/signup.dart';
import 'package:testingapp/screens/login/widgets/inputform.dart';
import 'package:testingapp/screens/posts/post_screen.dart';
import 'package:testingapp/widget/roundbutton.dart';

class Loginpage extends StatefulWidget {

  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final passwordcontroller = TextEditingController();
   bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void login(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
      email: emailcontroller.text,
       password: passwordcontroller.text.toString()).then((value){
        setState(() {
          loading = false;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
        ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                         content: Text("Login Successful"),
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
  }

  @override
  // use nhi hai toh discard krta hai
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login", style: TextStyle(
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
                  icon: Icon(Icons.password_outlined),
                   helpertxt: 'pass@123', 
                   validatetxt: 'Enter Password',
                )
                  ],
                ) 
                ),
              

              Roundbutton(
                title: "Login",
                loading: loading,
                 onTap: (){
                  if(_formkey.currentState!.validate()){
                    
                    login();
                     
                  }
                 }
                 ), 


                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text("Dont' have an account?"),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                      }, 
                      child: const Text(
                      "Sign In"
                    ))
                  ],
                )

            ],
          ),
        ),
      ),
    );
  }
}

