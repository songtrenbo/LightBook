import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/homepage/components/fragment/home_fragment_listbook.dart';
import 'package:lightbook_flutter/models/users.dart';
import 'package:lightbook_flutter/widgets/book_item2.dart';

import '../../../models/books.dart';

class PopularFragment extends StatelessWidget {
  final user = Users.init()[1];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListBook(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Tiếp tục đọc",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        BookItem2(
          book: Books.init()[4],
          isShowRate: false,
        ),
        BookItem2(
          book: Books.init()[6],
          isShowRate: false,
        ),
        BookItem2(
          book: Books.init()[9],
          isShowRate: false,
        ),
        BookItem2(
          book: Books.init()[35],
          isShowRate: false,
        ),
      ],
    );
  }
}
