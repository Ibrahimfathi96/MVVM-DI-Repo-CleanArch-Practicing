import 'package:flutter/material.dart';
import 'package:route_ecommerce/api/api_manager.dart';
import 'package:route_ecommerce/ui/dialog%20utils.dart';
import 'package:route_ecommerce/ui/widgets/custom_form_field.dart';
import 'package:route_ecommerce/ui/widgets/form_label.dart';

import '../widgets/custom_submit_button.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/route_logo.png',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const FormLabel(labelText: 'Full Name'),
                      CustomFormField(
                        hintText: 'enter your full name',
                        textInputType: TextInputType.name,
                        controller: nameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter your full name';
                          }
                        },
                      ),
                      const FormLabel(labelText: 'Email'),
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
                      const FormLabel(labelText: 'Confirm Password'),
                      CustomFormField(
                        hintText: 'confirm your password',
                        controller: confirmPassController,
                        hideText: true,
                        textInputType: TextInputType.visiblePassword,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 're-enter your password';
                          }
                          if (passController.text != text) {
                            return "password doesn't match";
                          }
                        },
                      ),
                      const FormLabel(labelText: 'Phone Number'),
                      CustomFormField(
                        hintText: 'enter your phone',
                        controller: phoneController,
                        textInputType: TextInputType.phone,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter your phone';
                          }
                          //TODO: maybe validate phone number is 11 or something
                        },
                      ),
                      CustomFormSubmitButton(
                        text: 'Sign Up',
                        onPress: () {
                          register();
                        },
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

  void register()async {
    //validate form
    if (formKey.currentState?.validate() == false) {
      return;
    }
    DialogUtils.showProgressDialog(context, "loading...");

    try {
      var response = await ApiManager.register(nameController.text, emailController.text,
          passController.text, confirmPassController.text, phoneController.text);
      DialogUtils.hideDialog(context);
      if(response.errors!=null){
        DialogUtils.showMessage(context, response.mergeErrors(),posActionTitle: "ok");
        return ;
      }
      DialogUtils.showMessage(context, response.token ??'',posActionTitle: "ok");
    }catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, "Error, "+e.toString());
    }


  }
}
