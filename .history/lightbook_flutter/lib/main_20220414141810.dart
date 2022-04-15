import 'package:flutter/material.dart';
import 'package:lightbook_flutter/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: routes,
    );
  }
}
