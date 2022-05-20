import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/homepage/components/fragment/home_fragment_listbook.dart';
import 'package:lightbook_flutter/models/users.dart';

class FreeFragment extends StatelessWidget {
  final user = Users.init()[1];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListBook(idCategory: 2),
        ListBook(idCategory: 3),
      ],
    );
  }
}
