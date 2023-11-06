import 'package:admin/constants.dart';
import 'package:admin/controllers/providers/userprovider.dart';
import 'package:admin/controllers/usercontroller.dart';
import 'package:admin/models/getalluser.dart';
import 'package:admin/screens/components/header.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPaddinghight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(),
          Container(
              width: 1400,
              height: 850,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(defaultPaddinghight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Titlename(title: "Users Account Management : "),
                    SizedBox(
                      height: defaultPaddinghight,
                    ),
                    Container(width: 1300, height: 740, child: UserGridView()),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}

class UserCardwidget extends StatelessWidget {
  final UsersModel user;

  UserCardwidget({this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: bgColor,
      child: Padding(
        //  padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
        padding: const EdgeInsets.all(defaultPaddinghight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                child: Text(user.username,
                    style: TextStyle(
                      color: headline,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ))),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone,
                    size: 15,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      child: Text(user.phone,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ))),
                ]),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: SvgPicture.asset(
                    "assets/icons/email.svg",
                    width: 12,
                    height: 10,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                SizedBox(
                    child: Text(user.email,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return UserDetailsDialog(user);
                      });
                },
                child: Text(
                  "See more details ->",
                  style: TextStyle(color: extra, fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}

class UserGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserController>(context);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 5 cards in each row
        childAspectRatio:
            6 / 4, // Adjust this value to change the card's aspect ratio
      ),
      itemBuilder: (BuildContext context, int index) {
        return UserCardwidget(user: provider.usersModel[index]);
      },
      itemCount: provider.usersModel.length,
    );
  }
}

class UserDetailsDialog extends StatefulWidget {
  UserDetailsDialog(this.model);
  UsersModel model;

  @override
  State<UserDetailsDialog> createState() => _UserDetailsDialog();
}

class _UserDetailsDialog extends State<UserDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: 700,
        height: 400,
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.all(Radius.circular(0))),
        padding: EdgeInsets.fromLTRB(50, 20, 40, 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  width: 190,
                ),
                Text(
                  "Profile details",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: .start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      widget.model.username,
                      style: TextStyle(fontSize: 25.0, color: headline),
                    ),
                    SizedBox(height: 20.0),
                    _buildDetailText('Email:', widget.model.email),
                    SizedBox(height: 15.0),
                    _buildDetailText('Phone:', widget.model.phone),
                    SizedBox(height: 15.0),
                    _buildDetailText('CV Link:', widget.model.cv),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(190, 0, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          {
                            AwesomeDialog(
                              width: 400,
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              btnCancelText: 'done',
                              btnCancelOnPress: () {},
                            ).show();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(
                              255, 129, 38, 31), // Set button color to red
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_rounded,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Delete Account',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDetailText(String label, String value) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 16.0),
      children: [
        TextSpan(
          text: '$label ',
          style: TextStyle(
            color: extra,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
