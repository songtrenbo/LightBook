import 'package:flutter/widgets.dart';
import 'package:lightbook_flutter/book/bookpage.dart';
import 'package:lightbook_flutter/favorite/favorite_page.dart';
import 'package:lightbook_flutter/signup/signuppage.dart';
import 'package:lightbook_flutter/splashpage.dart';
import 'package:lightbook_flutter/signin/signinpage.dart';
import 'package:lightbook_flutter/homepage/homepage.dart';

import 'category/category_detail_page.dart';

// import 'cart/cartpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  HomePage.routeName: (context) => HomePage(),
  BookPage.routeName: (context) => BookPage(),
  CategoryDetailPage.routeName: (context) => CategoryDetailPage(),
  FavoritePage.routeName : (context) => FavoritePage(),
};
