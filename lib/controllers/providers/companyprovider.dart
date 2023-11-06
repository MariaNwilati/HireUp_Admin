import 'package:admin/controllers/companycontroller.dart';
import 'package:admin/models/getAllcompanies.dart';
import 'package:flutter/cupertino.dart';

class CompanyProvider extends ChangeNotifier {
CompanyProvider();
List <CompaniesModel> companies =[
  CompaniesModel(2, 1233333, 1, 1, 'email', 'sdww', 'location', 'assets/images/profile_pic.png', 'specialization', 'document'),
  CompaniesModel(2, 1233333, 0, 0, 'email', 'saaa', 'location', 'assets/images/profile_pic.png', 'specialization', 'document')
];
Future<void> fetchcompany() async{
try {
  final companieslist =await CompanyController().allcompanies();
  companies=companieslist;
  notifyListeners();
} on Exception catch (e) {

  // TODO
}

}
}