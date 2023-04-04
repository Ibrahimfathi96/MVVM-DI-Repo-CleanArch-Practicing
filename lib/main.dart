import 'package:flutter/material.dart';
import 'package:route_ecommerce/ui/login/login_screen.dart';
import 'package:route_ecommerce/ui/register/register_screen.dart';
import 'package:route_ecommerce/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent
        ),
        primaryColor: const Color(0xff004182),
        scaffoldBackgroundColor: const Color(0xff004182)
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        SplashScreen.routeName :(_)=> const SplashScreen(),
        RegisterScreen.routeName :(_)=>  RegisterScreen(),
        LoginScreen.routeName :(_)=>  LoginScreen(),
      },
    );
  }
}

