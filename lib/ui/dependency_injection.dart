import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_ecommerce/api/api_manager.dart';
import 'package:route_ecommerce/provider/app_config_provider.dart';
import 'package:route_ecommerce/repository/auth_repo/auth_repo_contract.dart';
import 'package:route_ecommerce/repository/auth_repo/implementations/auth_remote_data_source_impl.dart';
import 'package:route_ecommerce/repository/auth_repo/implementations/auth_repo_impl.dart';


///manual dependency injestion but we can use other libraries like injectable or getIt
AuthRepository getAuthRepository(AuthRemoteDataSource authRemoteDataSource){
  return AuthRepositoryImp(authRemoteDataSource);
}

AuthRemoteDataSource getAuthRemoteDataource(ApiManager apiManager){
  return AuthRemoteDataSourceImpl(apiManager);
}

ApiManager getApiManger(){
  return ApiManager();
}

AuthRepository injectAuthRepository(){
  return getAuthRepository(getAuthRemoteDataource(getApiManger()));
}

AppConfigProvider getAppConfigProvider(BuildContext context){
  return Provider.of<AppConfigProvider>(context,listen: false);
}