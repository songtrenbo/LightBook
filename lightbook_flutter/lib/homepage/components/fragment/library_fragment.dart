import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/widgets/book_item2.dart';

import '../../../models/books.dart';
import '../../../models/utilities.dart';

class LibraryFragment extends StatelessWidget {
  Books book = Utilities.getBookById(2);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Thư viện của tôi",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            BookItem2(book: Books.init()[5],isShowRate: true,),
            BookItem2(book: Books.init()[15],isShowRate: true,),
            BookItem2(book: Books.init()[16],isShowRate: true,),
            BookItem2(book: Books.init()[24],isShowRate: true,),
          ],
        ),
      ),
    );
  }
}
