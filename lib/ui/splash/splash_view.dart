import 'dart:async';
import 'package:flutter/material.dart';
import 'package:route_ecommerce/ui/register/register_view.dart';

class SplashView extends StatelessWidget {
  static const String routeName = 'splash';
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),(){
        Navigator.pushReplacementNamed(context, RegisterView.routeName);
    });
    return Scaffold(
      body: Image.asset('assets/images/splash_screen.png',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
