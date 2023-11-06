import 'package:admin/constants.dart';
import 'package:admin/controllers/jobs_controller.dart';
import 'package:admin/controllers/providers/companyprovider.dart';
import 'package:admin/controllers/providers/userprovider.dart';
import 'package:admin/screens/dashboard/dashmain.dart';
import 'package:admin/screens/jobs/jobs_screen.dart';
import 'package:admin/screens/jobs/jobsmain.dart';
import 'package:admin/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/companycontroller.dart';
import 'controllers/usercontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (_)=>CompanyController()..allcompanies(),),
          ChangeNotifierProvider(create: (_)=>UserController()..allUsers(),),
          ChangeNotifierProvider(create: (_)=>JobController()..getAllJobs(),),
        
        ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HireUp Admin Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: background,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white, fontFamily: 'playfair'),
          canvasColor: secondaryColor,
        ),
        home: DashMain(),
      ),
    );
  }
}
