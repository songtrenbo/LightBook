import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/homepage/components/body.dart';

class HomePage extends StatelessWidget {
  int selectIndex = 0;
  static String routeName = "/home_screen";
  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Text('Đây là trang chủ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)));
  }
}
