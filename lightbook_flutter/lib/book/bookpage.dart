import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/models/books.dart';

import 'components/body.dart';

class BookPage extends StatelessWidget {
  static String routeName = "/book_detail";

  @override
  Widget build(BuildContext context) {
    final BookDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as BookDetailsArguments;

    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        // title: Text(arguments.book.name),
        backgroundColor: Colors.transparent,elevation: 0,
      ),
      body: Body(book: arguments.book),
    );
  }
}

class BookDetailsArguments {
  final Books book;

  BookDetailsArguments({required this.book});
}
