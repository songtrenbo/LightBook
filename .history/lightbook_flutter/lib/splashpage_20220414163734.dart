import 'package:flutter/material.dart';
import 'package:lightbook_flutter/signin/signinpage.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    new Future.delayed(new Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
          context, SignInPage.routeName, (Route<dynamic> route) => false);
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xFF121212), boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 8,
            )
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 180,
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xFF121212),
                  color: Colors.white,
                  strokeWidth: 8,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Loading...',
                style: TextStyle(
                    fontFamily: 'BeauRivage',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              )
            ],
          ),
        ),
      ),
    );
  }
}
