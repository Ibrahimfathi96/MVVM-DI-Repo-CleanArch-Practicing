import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String labelText;
  const FormLabel({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom: 8) ,
      child: Text(labelText,
        style: const TextStyle(
          color: Colors.white,fontSize: 18
        ),
      ),
    );
  }
}
