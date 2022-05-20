import 'package:flutter/material.dart';
import 'package:lightbook_flutter/constant/color.dart';

import 'components/body.dart';

class SignUpPage extends StatelessWidget {
  int selectIndex = 0;
  static String routeName = "/signup";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.primaryColor,
      body: Body(),
    );
  }
}
