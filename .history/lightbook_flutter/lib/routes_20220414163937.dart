import 'package:flutter/widgets.dart';
import 'package:lightbook_flutter/signup/signuppage.dart';
import 'package:lightbook_flutter/splashpage.dart';
import 'package:lightbook_flutter/signin/signinpage.dart';
import 'package:lightbook_flutter/homepage/homepage.dart';
import 'package:lightbook_flutter/signin/signinpage.dart';

// import 'cart/cartpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignInPage(),
  // SignInPage.routeName : (context) => SignInPage(),
  // HomePage.routeName : (cotext) => HomePage(),
};
