import 'package:flutter/material.dart';
import 'package:lightbook_flutter/homepage/homepage.dart';
import 'package:lightbook_flutter/models/utilities.dart';

import 'components/body.dart';

class CategoryDetailPage extends StatelessWidget {
  static String routeName = "/category_detail";
  @override
  Widget build(BuildContext context) {
    int categoryId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          Utilities.getCategoryById(categoryId).name,
        ),
        centerTitle: true,
      ),
      body: Body(categoryId),
    );
  }
}
