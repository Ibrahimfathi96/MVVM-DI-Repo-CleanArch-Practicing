import 'package:flutter/material.dart';

abstract class LoginNavigator {
  void hideDialog();

  void showMessage(
    String message, {
    bool isDismissible = true,
    VoidCallback? posAction,
    VoidCallback? negAction,
    String? posActionTitle,
    String? negActionTitle,
    String? posMessage,
    String? negMessage,
  });

  void showProgressDialog(String message, {bool isDismissible = true});

  void goToHome();
}
