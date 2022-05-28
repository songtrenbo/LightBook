import 'package:flutter/material.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/utilities.dart';
import 'package:lightbook_flutter/widgets/book_item1.dart';

class CategoryDetail extends StatefulWidget {
  int id;
  CategoryDetail(this.id);
  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    Future<List<Books>> futureBook = Utilities().fetchBooksByCategoryId(widget.id);
    return FutureBuilder<List<Books>>(
      future: futureBook,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return BookItem1(book: snapshot.data![index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
