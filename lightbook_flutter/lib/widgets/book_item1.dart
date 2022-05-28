import 'package:flutter/material.dart';
import 'package:lightbook_flutter/book/bookpage.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookItem1 extends StatelessWidget {
  Books book;
  BookItem1({required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, BookPage.routeName,
          arguments: BookDetailsArguments(book: book)),
      child: Container(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                book.picture,
                width: 80,
                fit: BoxFit.contain,
              ),
            ),
            RatingBarIndicator(
              rating: 2.75,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 12.0,
              direction: Axis.horizontal,
            ),
            SizedBox(
              height: 16,
              child: Text("${book.name}"),
            ),
          ],
        ),
      ),
    );
  }
}
