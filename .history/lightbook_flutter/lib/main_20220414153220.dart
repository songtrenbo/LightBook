import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lightbook_flutter/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
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
            appId: appId,
            messagingSenderId: messagingSenderId,
            projectId: projectId));
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
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: routes,
    );
  }
}
