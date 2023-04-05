import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_ecommerce/ui/dialog%20utils.dart';
import 'package:route_ecommerce/ui/register/register_navigator.dart';
import 'package:route_ecommerce/ui/register/register_view_model.dart';
import 'package:route_ecommerce/ui/widgets/custom_form_field.dart';
import 'package:route_ecommerce/ui/widgets/form_label.dart';

import '../widgets/custom_submit_button.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = 'register';
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> implements RegisterNavigator{
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  RegisterViewModel registerViewModel = RegisterViewModel();

  void register() async {
    //validate form
    if (formKey.currentState?.validate() == false) {
      return;
    }
    registerViewModel.register(nameController.text, emailController.text,
        passController.text, confirmPassController.text, phoneController.text);
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
  void initState() {
    super.initState();
    registerViewModel.registerNavigator = this;
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => registerViewModel,
      child: Scaffold(
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
                            return null;
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
                            return null;
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
                            return null;
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
      ),
    );
  }
}
