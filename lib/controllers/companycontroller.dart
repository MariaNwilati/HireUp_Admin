import 'dart:html' as html;

import 'package:admin/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constant.dart';
import '../models/getAllcompanies.dart';

class CompanyController extends ChangeNotifier {
  List<CompaniesModel> companiesModel = [];
  Future allcompanies() async {
    Dio dio = Dio();

    await dio
        .post("${Constant.baseURL}/admin/getAllCompaniesAccounts",
            options: Options(headers: {
              "Authorization":
                  "Bearer ${Constant.token}"
            }))
        .then((value) {
      value.data["data"]["data"].forEach((e) {
        companiesModel.add(CompaniesModel.fromJson(e));
      });
      print(companiesModel[0].id);
      notifyListeners();
    }).catchError((error) {
      print(error.message);
    });
  }

  Future acceptcompanies(int id, int active) async {
    Dio dio = Dio();
 
    
    await dio.post("${Constant.baseURL}/admin/activateCompanyAccount",
        options: Options(headers: {
          "Authorization":
              "Bearer ${Constant.token}"
        }),
        data: {
          "companyId": id,
          "active": active,
        }).then((value) {
      print(value.data);
      html.window.location.reload();
      notifyListeners();
    }).catchError((error) {
      print(error.response.data);
    });
  }
}
