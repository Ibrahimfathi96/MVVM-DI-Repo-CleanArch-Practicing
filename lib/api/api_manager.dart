import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_ecommerce/api/model/request/LoginRequest.dart';
import 'package:route_ecommerce/api/model/request/RegisterRequest.dart';
import 'package:route_ecommerce/api/model/response/LoginResponse.dart';
import 'package:route_ecommerce/api/model/response/RegisterResponse.dart';
import 'package:route_ecommerce/constants.dart';

class ApiManager {
  static Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) async {
    var requestBody = RegisterRequest(
        name: name,
        password: password,
        phone: phone,
        repassword: rePassword,
        email: email);
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.register);
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }


  static Future<LoginResponse> login(String email, String password,) async {
    var requestBody = LoginRequest(
        password: password,
        email: email);
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.login);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}
