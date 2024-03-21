import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  const AuthField({super.key,required this.hint,required this.controller, this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hint,
      ),
      validator: (value) {
        if(value!.isEmpty){
          return "$hint is missing";
        }
        return null;
      },
    );
  }
}