import 'package:admin/screens/user/users_screen.dart';
import 'package:flutter/material.dart';

import '../components/side_menu.dart';

class UserMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: SideMenu()),
        Expanded(
            flex: 6,
            child: UserScreen())
      ],
    )));
  }
}
