import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Verifyphone extends StatefulWidget {
  String verificationId;
  Verifyphone({super.key, required this.verificationId});

  @override
  State<Verifyphone> createState() => _VerifyphoneState();
}

class _VerifyphoneState extends State<Verifyphone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
      ),

      body: Column(
        children: [

        ],
      ),
    );
  }
}