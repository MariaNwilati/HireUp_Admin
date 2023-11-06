import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../components/side_menu.dart';

class DashMain extends StatelessWidget {
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
            child: DashboardScreen())
      ],
    )));
  }
}
