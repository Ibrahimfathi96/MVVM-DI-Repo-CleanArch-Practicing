/*
in this class there's no widget so we don't have BuildContext or context
How can we get context to use our DialogUtils functions
Don't use context out of widgets or view classes
big mistake to let your viewModel depends on *another class* or *contexts/widgets*
it might cause memory/context leakage
***the solution here is using interface classes to provide you the same funs without context
and in the view class you implement those functions and be able to use context
*/

import 'package:flutter/material.dart';
import 'package:route_ecommerce/api/api_manager.dart';
import 'package:route_ecommerce/ui/login/login_navigator.dart';

class LoginViewModel extends ChangeNotifier {
  LoginNavigator? loginNavigator;//nullable missing implementation => view implements this

  void login(String email, String password)async{
    loginNavigator?.showProgressDialog("loading...");

    try {
      var response = await ApiManager.login( email, password);
      loginNavigator?.hideDialog();
      if(response.message!=null){
        loginNavigator?.showMessage( response.message ??'',posActionTitle: "ok");
        return ;
      }
      loginNavigator?.showMessage(response.token ??'',posActionTitle: "ok");
    }catch (e) {
      loginNavigator?.hideDialog();
      loginNavigator?.showMessage("Error, $e");
    }
  }
}