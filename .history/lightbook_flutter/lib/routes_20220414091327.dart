import 'package:flutter/widgets.dart';
import 'package:lightbook_flutter/splashpage.dart';
import 'package:lightbook_flutter/signin/signinpage.dart';
import 'package:lightbook_flutter/homepage/homepage.dart';
import 'package:lightbook_flutter/signin/signinpage.dart';

// import 'cart/cartpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName : (context) => SplashPage(),
  Signpage.routeName:(context)=> Signpage(),
  // SignInPage.routeName : (context) => SignInPage(),
  // HomePage.routeName : (cotext) => HomePage(),
};