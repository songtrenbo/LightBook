import 'package:flutter/material.dart';

import 'components/body.dart';

class Signpage extends StatelessWidget {
  int selectIndex = 0;
  static String routeName = "/signin";
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF121212),
      body: Body(),
    );
  }
}
