import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin/models/getAlljobs.dart';
import 'dart:html' as html;

import '../constant.dart';
class JobController extends ChangeNotifier {
  List<JobModel> jobModel=[];
  Future getAllJobs() async {
    Dio dio = Dio();
    await dio
        .post("${Constant.baseURL}/admin/getAllJobs",
            options: Options(headers: {
              "Authorization":
                  "Bearer ${Constant.token}"
            }))
        .then((value) {
      value.data["data"]["data"].forEach((e) {
        jobModel.add(JobModel.fromJson(e));
      });
      notifyListeners();
    }).catchError((error) {print(error.toString());});
  }
  Future acceptJob(int jobId,)async{
      Dio dio = Dio();
    await dio
        .post("${Constant.baseURL}/admin/acceptCompanyJob",data: {"jobId":jobId,"accept":1},
            options: Options(headers: {
              "Authorization":
                  "Bearer ${Constant.token}"
            })).then((value) {
              html.window.location.reload();
              notifyListeners();
            }).catchError((error){
              print(error.toString());
            });
  }
}
