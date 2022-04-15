import 'package:flutter/material.dart';
import 'package:lightbook_flutter/signup/components/signupform.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            headerScreen(context),
            SignUpForm()
          ],
        ),
      ),
    ));
  }
}


  @override
  Widget headerScreen(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      width:  MediaQuery.of(context).size.width, 
      alignment: Alignment.topCenter,     
      child: Image.asset("./assets/logo.png"),
    );
  }
