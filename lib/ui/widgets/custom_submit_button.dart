import 'package:flutter/material.dart';

class CustomFormSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const CustomFormSubmitButton({Key? key, required this.text, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        backgroundColor: Colors.white
      ),
        onPressed: onPress,
        child: Text(text,
        style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor
        ),
        ),
    );
  }
}
