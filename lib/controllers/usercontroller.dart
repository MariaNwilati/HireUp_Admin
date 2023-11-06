import 'package:admin/constant.dart';
import 'package:admin/models/getalluser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constant.dart';
import '../models/getAllcompanies.dart';

class UserController extends ChangeNotifier {
  List<UsersModel> usersModel = [];
  Future<List<UsersModel>> allUsers() async {
    Dio dio = Dio();

    await dio
        .post("${Constant.baseURL}/admin/getAllUserAccounts",
            options: Options(headers: {
              "Authorization":
                  "Bearer ${Constant.token}"
            }))
        .then((value) {
          value.data["data"].forEach((e){
            usersModel.add(UsersModel.fromJson(e));
          });
          notifyListeners();})
        .catchError((error) {print(error.toString());});
  }
}
