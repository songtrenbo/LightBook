import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lightbook_flutter/constant/color.dart';
import 'package:lightbook_flutter/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyC1uOZeGsO0idmW1hxQakAg-CAL5fWx_iw",
      authDomain: "theta-strata-313406.firebaseapp.com",
      projectId: "theta-strata-313406",
      storageBucket: "theta-strata-313406.appspot.com",
      messagingSenderId: "678882744772",
      appId: "1:678882744772:web:830f5797bd461f3c226c91",
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: ColorConstants.primaryColor,
        scaffoldBackgroundColor: ColorConstants.primaryColor,
        // navigationBarTheme: ColorConstants.navbarColor,
        appBarTheme: AppBarTheme(
          color: ColorConstants.navbarColor,
        ),
        textTheme: TextTheme(
          // bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: routes,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
