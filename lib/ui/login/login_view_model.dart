/*
in this class there's no widget so we don't have BuildContext or context
How can we get context to use our DialogUtils functions
Don't use context out of widgets or view classes
big mistake to let your viewModel depends on *another class* or *contexts/widgets*
it might cause memory/context leakage
***the solution here is using interface classes to provide you the same funs without context
and in the view class you implement those functions and be able to use context
*/

import 'package:route_ecommerce/base/base_view_model.dart';
import 'package:route_ecommerce/provider/app_config_provider.dart';
import 'package:route_ecommerce/repository/auth_repo/auth_repo_contract.dart';
import 'package:route_ecommerce/ui/login/login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  AppConfigProvider configProvider;
  AuthRepository authRepository;
  // late AuthRemoteDataSource remoteDataSource;
  // late ApiManager apiManager;
  LoginViewModel(this.authRepository, this.configProvider);//constructor injection

  // LoginViewModel(){
  //   //we should use DI (Dependency Injection): this is not right
  //   apiManager  = ApiManager();
  //   remoteDataSource = AuthRemoteDataSourceImpl(apiManager);
  //  authRepository = AuthRepositoryImp(remoteDataSource);
  // }
  // LoginNavigator? loginNavigator;//nullable missing implementation => view implements this

  void login(String email, String password)async{
    navigator?.showProgressDialog("loading...");

    try {
      var token = await authRepository.login( email, password);
      navigator?.hideDialog();
      if(token!=null){
        navigator?.showMessage( 'unable to login, wrong username or password',posActionTitle: "ok");
        return ;
      }
      //navigate to home screen
      navigator?.showMessage('Successful Registration',posActionTitle: "ok",
        posAction: (){
        //navigate to home
          navigator?.goToHome();
       // response.token  //save it
          configProvider.updateToken(token);
        },isDismissible: false
      );
    }catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage("Error, $e");
    }
  }
}