import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputfieldForm extends StatelessWidget {
   InputfieldForm({
    super.key,
    required this.controller,
    required this.valuetxt,
     required this.icon, 
     required this.helpertxt,
     required this.obscure, required this.validatetxt
  });

  final TextEditingController controller;
  final String validatetxt;
  final String valuetxt;
  String helpertxt;
  final Icon icon;
  bool obscure ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                    controller: controller,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      hintText: valuetxt,
                      helperText: helpertxt,
                      prefixIcon: icon,
                    ),

                    validator: (value){
                      if(value!.isEmpty){
                        return validatetxt;
                      }
                      return null;
                    },
                  );
  }
}