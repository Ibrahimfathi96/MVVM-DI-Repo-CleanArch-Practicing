
import 'package:route_ecommerce/repository/auth_repo/auth_repo_contract.dart';
import 'package:route_ecommerce/ui/register/register_navigator.dart';
import '../../base/base_view_model.dart';
import '../../provider/app_config_provider.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator>{
  AppConfigProvider configProvider;
  AuthRepository authRepository;

  RegisterViewModel(this.configProvider,this.authRepository);//dependency injection constructor
  void register(String name,String email, String password,String confirmPassword,String phone)async{
    navigator?.showProgressDialog("loading...");

    try {
      var token = await authRepository.register(name, email,
          password, confirmPassword, phone);
      navigator?.hideDialog();
      if(token==null){
        navigator?.showMessage('unable to register',posActionTitle: "ok");
        return ;
      }
      navigator?.showMessage('Successful Login ',posActionTitle: "ok",
        posAction: (){
        // response.token  //save it
        configProvider.updateToken(token);
        navigator?.goToHome();
        }
      );
    }catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage("Error, $e");
    }
  }
}