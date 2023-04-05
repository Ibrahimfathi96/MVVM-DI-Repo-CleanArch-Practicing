import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_ecommerce/provider/app_config_provider.dart';
import 'package:route_ecommerce/ui/dialog%20utils.dart';
import 'package:route_ecommerce/ui/home/home_view.dart';
import 'package:route_ecommerce/ui/login/login_navigator.dart';
import 'package:route_ecommerce/ui/login/login_view_model.dart';
import 'package:route_ecommerce/ui/register/register_view.dart';
import 'package:route_ecommerce/ui/widgets/custom_form_field.dart';
import 'package:route_ecommerce/ui/widgets/form_label.dart';

import '../widgets/custom_submit_button.dart';

class LoginView extends StatefulWidget{
  static const String routeName = 'login';
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> implements LoginNavigator{
  var formKey = GlobalKey<FormState>();

  LoginViewModel loginViewModel = LoginViewModel();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void logIn() async {
    //validate form first
    if (formKey.currentState?.validate() == false) {
      return;
    }
    //our main logic
    loginViewModel.login(emailController.text, passController.text);
  }

  @override
  void initState() {
    super.initState();
    loginViewModel.loginNavigator = this;
    loginViewModel.configProvider = Provider.of<AppConfigProvider>(context);
  }

  @override
  void hideDialog() {
    DialogUtils.hideDialog(context);
  }

  @override
  void showMessage(String message,
      {bool isDismissible = true,
        VoidCallback? posAction,
        VoidCallback? negAction,
        String? posActionTitle,
        String? negActionTitle,
        String? posMessage,
        String? negMessage}) {
    DialogUtils.showMessage(context, message,
        isDismissible: isDismissible,
        posAction: posAction,
        posActionTitle: posActionTitle,
        negAction: negAction,
        negActionTitle: negActionTitle,
        negMessage: negMessage);
  }

  @override
  void showProgressDialog(String message, {bool isDismissible = true}) {
    DialogUtils.showProgressDialog(context, message,
        isDismissible: isDismissible);
  }
  
  @override
  void goToHome() {
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //to avoid re creating new object using LoginViewModel() every time rebuild
      //so we using single object we initialized above
      create: (context) => loginViewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/route_logo.png',
              ),
              const SizedBox(
                height: 64,
              ),
              const Text(
                'Welcome Back To Route',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const Text(
                'Please Sign in with your email',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const FormLabel(labelText: 'User Name / Email '),
                        CustomFormField(
                          hintText: 'enter your email',
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                            //TODO: validate email's format
                          },
                        ),
                        const FormLabel(labelText: 'Password'),
                        CustomFormField(
                          hintText: 'enter your password',
                          controller: passController,
                          hideText: true,
                          textInputType: TextInputType.visiblePassword,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'enter your password';
                            }
                            return null;
                          },
                        ),
                        const Text(
                          'Forget Password?',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        CustomFormSubmitButton(
                          text: 'Sign In',
                          onPress: () {
                            logIn();
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.pushNamed(context, RegisterView.routeName);
                          },
                          child: const Text(
                            "don't have an account? Create new Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
