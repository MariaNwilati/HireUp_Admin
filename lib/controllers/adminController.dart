import 'package:admin/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../constant.dart';
import '../models/loginModel.dart';

class AdminLoginController extends ChangeNotifier{
  Future<String> loginAdmin(String email, String password) async {
    Dio dio = Dio();
    LoginModel loginModel;
    try {
  var response = await dio.post("${Constant.baseURL}/api/login", data: {
    "email": email,
    "password": password,
  });
  if(response.statusCode==200){
    print("Logged in succesfully");
    Constant.emailadmin =response.data["data"]["email"];
    Constant.username =response.data["data"]["username"];
    Constant.phone =response.data["data"]["phone"];
    loginModel=LoginModel.fromJson(response.data);
    
    return "Success";
  }
} on Exception catch (e) {
    print("Failed");
    return "Failed";
  // TODO
}
return "Failed";
  }
}
