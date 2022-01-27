import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Mainpage/mainpage_screen.dart';
import 'package:flutter_auth/Screens/Mainpage/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.10),
            Text(
              "Test_String",
              style: TextStyle(fontSize: 40, fontFamily: 'poppins')
            ),
            SizedBox(height: size.height * 0.03),
            ],
        ),
      ),
    );
  }
}
