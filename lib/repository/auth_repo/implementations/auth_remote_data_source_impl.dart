import 'package:route_ecommerce/api/api_manager.dart';
import 'package:route_ecommerce/api/model/response/LoginResponse.dart';
import 'package:route_ecommerce/api/model/response/RegisterResponse.dart';
import 'package:route_ecommerce/repository/auth_repo/auth_repo_contract.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<LoginResponse> login(String email, String password) async{
    return await apiManager.login(email, password);
  }

  @override
  Future<RegisterResponse> register(String name, String password, String email, String confirmPassword, String phone) async{
    return await apiManager.register(name, email, password, confirmPassword, phone);
  }

}