import 'package:flutter/material.dart';

const primaryColor = Color(0xFFb5c1e2);
const secondaryColor = Color(0xFF455275);
const bgColor = Color.fromRGBO(21, 30, 61, 1);
const fast = Color(0xFFFFD591);
const extra = Color.fromARGB(255, 145, 158, 213);
const headline = Color(0xFFE2F790);
const background=Color(0xFF1A2543);
const defaultPaddingwidth = 10.0;
const defaultPaddinghight = 25.0;
const header =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500);

class Titlename extends StatelessWidget {
  const Titlename({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}

class Titlename2 extends StatelessWidget {
  const Titlename2({
    Key key,
    @required this.title2,
  }) : super(key: key);
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Text(
      title2,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}

class Titlename3 extends StatelessWidget {
  const Titlename3({
    Key key,
    @required this.title2,
  }) : super(key: key);
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Text(
      title2,
      style: TextStyle(fontSize: 15, color: headline),
    );
  }
}
