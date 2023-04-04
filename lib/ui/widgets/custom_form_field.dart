import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
class CustomFormField extends StatelessWidget {
  String hintText;
  Validator? validator;
  TextEditingController? controller;
  TextInputType? textInputType;
  bool hideText;
  CustomFormField({required this.hintText,this.validator,this.controller,this.textInputType = TextInputType.text,this.hideText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        validator:validator ,
        controller: controller,
        keyboardType: textInputType,
        obscureText: hideText,
        decoration: InputDecoration(
            hintText:hintText,
          hintStyle: const TextStyle(
            fontSize: 18
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
      ),
    );
  }
}
