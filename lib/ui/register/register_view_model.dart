
import 'package:route_ecommerce/api/api_manager.dart';
import 'package:route_ecommerce/ui/register/register_navigator.dart';
import '../../base/base_view_model.dart';
import '../../provider/app_config_provider.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator>{
  AppConfigProvider? configProvider;

  void register(String name,String email, String password,String confirmPassword,String phone)async{
    navigator?.showProgressDialog("loading...");

    try {
      var response = await ApiManager.register(name, email,
          password, confirmPassword, phone);
      navigator?.hideDialog();
      if(response.errors!=null){
        navigator?.showMessage(response.mergeErrors(),posActionTitle: "ok");
        return ;
      }
      navigator?.showMessage('Successful Login ',posActionTitle: "ok",
        posAction: (){
        // response.token  //save it
        configProvider?.updateToken(response.token);
        navigator?.goToHome();
        }
      );
    }catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage("Error, $e");
    }
  }
}