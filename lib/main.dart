import 'package:flutter/material.dart';
import 'package:route_ecommerce/ui/home/home_view.dart';
import 'package:route_ecommerce/ui/login/login_view.dart';
import 'package:route_ecommerce/ui/register/register_view.dart';
import 'package:route_ecommerce/ui/splash/splash_view.dart';

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
      initialRoute: LoginView.routeName,
      routes: {
        SplashView.routeName :(_)=> const SplashView(),
        RegisterView.routeName :(_)=>  const RegisterView(),
        LoginView.routeName :(_)=>  const LoginView(),
        HomeView.routeName :(_)=>  const HomeView(),
      },
    );
  }
}

