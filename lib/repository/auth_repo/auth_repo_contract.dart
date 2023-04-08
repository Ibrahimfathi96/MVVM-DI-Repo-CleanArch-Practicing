import 'package:route_ecommerce/api/model/response/LoginResponse.dart';
import 'package:route_ecommerce/api/model/response/RegisterResponse.dart';

abstract class AuthRepository {
  ///this login function returns token in case of successful
  ///and returns null in case of failed login
  Future<String?> login(String email, String password);
  Future<String?> register(String name, String password, String email,
      String confirmPassword, String phone);
}

///data source class to call the api
abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);
  Future<RegisterResponse> register(String name, String password, String email,
      String confirmPassword, String phone);
}

///data source class to call the data from firebase
abstract class FirebaseDataSource {}

///data source class to call the data from local
abstract class LocalDataSource {}
