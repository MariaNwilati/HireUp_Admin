import 'package:admin/constant.dart';
import 'package:admin/constants.dart';
import 'package:admin/screens/dashboard/dashmain.dart';
import 'package:admin/screens/employers/employermain.dart';
import 'package:admin/screens/login.dart';
import 'package:admin/screens/user/usermain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../jobs/jobsmain.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Map<String, bool> menuItems = {
    "Dashboard": false,
    "Employers": false,
    "Jobs": false,
    "Users": false,
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/hireup.png"),
            ),
            SizedBox(height: 5),
            buildMenuItem(
              title: "Dashboard",
              svgSrc: "assets/icons/1.svg",
              onPressed: () {
                Get.to(DashMain());
                // Handle the onPressed event
              },
            ),
            SizedBox(height: 5),
            buildMenuItem(
              title: "Employers",
              svgSrc: "assets/icons/2.svg",
              onPressed: () {
                Get.to(EmployerMain());
              },
            ),
            SizedBox(height: 5),
            buildMenuItem(
              title: "Jobs",
              svgSrc: "assets/icons/3.svg",
              onPressed: () {
                Get.to(JobMain());
              },
            ),
            SizedBox(height: 5),
            buildMenuItem(
              title: "Users",
              svgSrc: "assets/icons/4.svg",
              onPressed: () {
                Get.to(UserMain());
              },
            ),
            SizedBox(height: 150),
            buildMenuItem(
              title: "Admin Maria",
              svgSrc: "assets/icons/admin.svg",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PopupCard(
                       
                       
                      );
                    });
              },
            ),
            buildMenuItem(
              title: "Logout",
              svgSrc: "assets/icons/logout.svg",
              onPressed: () {
                Get.offAll(LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({String title, String svgSrc, VoidCallback onPressed}) {
    bool isHovered = menuItems[title] ?? false;

    return MouseRegion(
      onEnter: (_) => _onHover(title, true),
      onExit: (_) => _onHover(title, false),
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          color: isHovered ? secondaryColor : Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            horizontalTitleGap: 0.0,
            leading: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: isHovered ? 30.0 : 24.0,
              height: isHovered ? 30.0 : 24.0,
              child: SvgPicture.asset(
                svgSrc,
                color: primaryColor,
              ),
            ),
            title: isHovered
                ? Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void _onHover(String title, bool isHovered) {
    setState(() {
      menuItems = Map.from(menuItems)
        ..update(title, (value) => isHovered, ifAbsent: () => isHovered);
    });
  }
}
// class SideMenu extends StatelessWidget {
//   const SideMenu({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: bgColor,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             DrawerHeader(
//                 child: Image.asset(
//               "assets/images/hireup.png",
//             )),
//             SizedBox(
//               height: 5,
//             ),
//             DrawerListTile(
//               title: "Dashboard",
//               svgSrc: "assets/icons/1.svg",
//               press: () {
//                 Get.to(DashMain(),
//                  transition: Transition.cupertino, // Slide transition to the left
//                   duration: Duration(milliseconds: 800),);
//               },
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             DrawerListTile(
//               title: "Employers",
//               svgSrc: "assets/icons/2.svg",
//               press: () {
//                 Get.to(EmployerMain(),
//                  transition: Transition.cupertino, // Slide transition to the left
//                   duration: Duration(milliseconds: 800),);
//               },
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             DrawerListTile(
//               title: "Jobs",
//               svgSrc: "assets/icons/3.svg",
//               press: () {
//                 Get.to(JobMain(),
//                  transition: Transition.cupertino, // Slide transition to the left
//                   duration: Duration(milliseconds: 800),);
//               },
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             DrawerListTile(
//               title: "Users",
//               svgSrc: "assets/icons/4.svg",
//               press: () {
//                 Get.to(
//                   UserMain(),
//                  transition: Transition.cupertino, // Slide transition to the left
//                   duration: Duration(milliseconds: 800),
//                 );
//               },
//             ),
//             SizedBox(
//               height: 230,
//             ),
//             DrawerListTile(
//               title: "Admin Maria",
//               svgSrc: "assets/icons/admin.svg",
//               press: () {
//                 {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return PopupCard(
//                         username: admin.username,
//                         phone: "${admin.number}",
//                         email: admin.email,
//                         password: admin
//                             .password, // Be cautious about displaying passwords in UI.
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//             DrawerListTile(
//               title: "Logout",
//               svgSrc: "assets/icons/logout.svg",
//               press: () {
//                 Get.offAll(LoginScreen()
//                 ,
//                  transition: Transition.downToUp, // Slide transition to the left
//                   duration: Duration(milliseconds: 500),);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DrawerListTile extends StatelessWidget {
//   const DrawerListTile({
//     Key key,
//     @required this.title,
//     @required this.svgSrc,
//     @required this.press,
//   }) : super(key: key);
//   final String title, svgSrc;
//   final VoidCallback press;
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: press,
//       horizontalTitleGap: 0.0,
//       leading: SvgPicture.asset(
//         svgSrc,
//         color: primaryColor,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }

class PopupCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            50.0), // Increased the borderRadius for more rounded edges
      ),
      elevation: 10.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: secondaryColor,
        ),
        //width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
             " Username: Maria",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Phone: 09288232",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Email: admin@gmail.com",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            // SizedBox(height: 20),
            // Text(
            //   'Password: $password',
            //   style: TextStyle(fontSize: 20, color: Colors.white),
            // ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 50, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Close",
                      style: TextStyle(fontSize: 17, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
