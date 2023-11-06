import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 700,
          child: SearchField(),
        ),
        // Spacer(flex: 7,),
        // ProfileCard(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: bgColor),
      decoration: InputDecoration(
        hintText: "Search for company, user or Jop title",
        hintStyle: TextStyle(color: bgColor),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPaddingwidth),
            margin: EdgeInsets.symmetric(horizontal: defaultPaddingwidth / 2),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: SvgPicture.asset(
              "assets/icons/feSearch2.svg",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
