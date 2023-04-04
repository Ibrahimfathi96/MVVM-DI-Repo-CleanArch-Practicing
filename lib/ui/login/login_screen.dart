import 'package:flutter/material.dart';
import 'package:route_ecommerce/api/api_manager.dart';
import 'package:route_ecommerce/ui/dialog%20utils.dart';
import 'package:route_ecommerce/ui/widgets/custom_form_field.dart';
import 'package:route_ecommerce/ui/widgets/form_label.dart';

import '../widgets/custom_submit_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();


  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/route_logo.png',
            ),
            SizedBox(height: 64,),
            Text('Welcome Back To Route',
            style: TextStyle(
              color: Colors.white,fontSize: 24
            ),
            ),
            Text('Please Sign in with your email',
              style: TextStyle(
                  color: Colors.white70,fontSize: 16
              ),
            ),
            SizedBox(height: 32,),
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
                        },
                      ),
                      Text('Forget Password?',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.white,fontSize: 18
                        ),
                      ),
                      SizedBox(height: 32,),
                      CustomFormSubmitButton(
                        text: 'Sign In',
                        onPress: () {
                          logIn();
                        },
                      ),
                      SizedBox(height: 16,),
                      Text("don't have an account? Create new Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,fontSize: 16
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
    );
  }

  void logIn()async {
    //validate form
    if (formKey.currentState?.validate() == false) {
      return;
    }
    DialogUtils.showProgressDialog(context, "loading...");

    try {
      var response = await ApiManager.login( emailController.text,
          passController.text);
      DialogUtils.hideDialog(context);
      if(response.message!=null){
        DialogUtils.showMessage(context, response.message ??'',posActionTitle: "ok");
        return ;
      }
      DialogUtils.showMessage(context, response.token ??'',posActionTitle: "ok");
    }catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, "Error, "+e.toString());
    }


  }
}
