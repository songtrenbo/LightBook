import 'package:flutter/material.dart';
import 'package:lightbook_flutter/homepage/homepage.dart';
import 'package:lightbook_flutter/models/utilities.dart';

import 'components/body.dart';

class FavoritePage extends StatelessWidget {
  static String routeName = "/favorite_detail";
  @override
  Widget build(BuildContext context) {
    // int categoryId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Sách yêu thích",
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
