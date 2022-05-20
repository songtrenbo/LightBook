import 'package:flutter/material.dart';

import 'category_detail.dart';

class Body extends StatelessWidget {
  int categoryId;
  Body(this.categoryId);
  @override
  Widget build(BuildContext context) {
    return CategoryDetail(categoryId);
  }
}
