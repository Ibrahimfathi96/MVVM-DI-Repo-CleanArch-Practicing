import 'package:route_ecommerce/repository/auth_repo/auth_repo_contract.dart';

class AuthRepositoryImp implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImp(this.authRemoteDataSource);

  @override
  Future<String?> login(String email, String password)async {
   var response =  await authRemoteDataSource.login(email, password);
   return response.token;
  }

  @override
  Future<String?> register(String name, String password, String email, String confirmPassword, String phone) async {
    var response = await authRemoteDataSource.register(name, password, email,
        confirmPassword, phone);
    return response.token;
  }
  

}