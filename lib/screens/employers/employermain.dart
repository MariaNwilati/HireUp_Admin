
import 'package:admin/screens/components/side_menu.dart';
import 'package:flutter/material.dart';

import 'employers_screen.dart';

class EmployerMain extends StatelessWidget {
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
            child: EmployerScreen())
      ],
    )));
  }
}
