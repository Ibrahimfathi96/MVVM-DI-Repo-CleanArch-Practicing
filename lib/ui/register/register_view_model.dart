
import 'package:flutter/material.dart';
import 'package:route_ecommerce/api/api_manager.dart';
import 'package:route_ecommerce/ui/register/register_navigator.dart';

class RegisterViewModel extends ChangeNotifier{
  RegisterNavigator? registerNavigator;

  void register(String name,String email, String password,String confirmPassword,String phone)async{
    registerNavigator?.showProgressDialog("loading...");

    try {
      var response = await ApiManager.register(name, email,
          password, confirmPassword, phone);
      registerNavigator?.hideDialog();
      if(response.errors!=null){
        registerNavigator?.showMessage(response.mergeErrors(),posActionTitle: "ok");
        return ;
      }
      registerNavigator?.showMessage(response.token ??'',posActionTitle: "ok");
    }catch (e) {
      registerNavigator?.hideDialog();
      registerNavigator?.showMessage("Error, $e");
    }
  }
}