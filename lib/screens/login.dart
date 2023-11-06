import 'package:admin/constants.dart';
import 'package:admin/controllers/adminController.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'dashboard/dashmain.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() async {
    AdminLoginController admin = AdminLoginController();
    String res =
        await admin.loginAdmin(_emailController.text, _passwordController.text);
    if (res == "Failed") {
      AwesomeDialog(
        width: 400,
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: "Invalide email or password",
        btnCancelOnPress: () {
         Get.to(LoginScreen());
        },
      )..show();
    }

    if (_formKey.currentState?.validate() ?? false) {
      if (_emailController.text == 'admin@gmail.com' &&
          _passwordController.text == '123admin') {
        // Login successful
        print('Login successful');
        Get.to(DashMain());
        // Navigate to the next screen or show a success message
      } else {
        // Login failed
        print('Login failed');
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: 800,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(500, 30, 500, 30),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: secondaryColor, // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 0), // Offset in x and y directions
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Image.asset(
                            "assets/images/hireup.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Titlename(title: "Welcome Back admin!"),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    floatingLabelStyle:
                                        TextStyle(color: Color(0xFFAEDFF6)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFAEDFF6)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter your email';
                                    }
                                    if (!value.contains('.com')) {
                                      return 'Please enter a valid email address';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    floatingLabelStyle:
                                        TextStyle(color: Color(0xFFAEDFF6)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFAEDFF6)),
                                    ),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter your password';
                                    }
                                    if (value.length < 6 ) {
                                      return 'Password must be at least 6 characters long';
                                    }else if(value!="123admin"){
                                      return "not correct";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 70),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(100, 0, 120, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFAEDFF6),
                                    ),
                                    onPressed: () {
                                      // _submitForm();
                                      if(_formKey.currentState.validate()){
                                        Get.to(DashMain());
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text("Login",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: bgColor,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  )),
            ),
          ),
        ));
  }
}
