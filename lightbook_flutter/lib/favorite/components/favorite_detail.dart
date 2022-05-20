import 'package:flutter/material.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/utilities.dart';
import 'package:lightbook_flutter/widgets/book_item1.dart';

class FavoriteDetail extends StatefulWidget {
  // int id;
  // FavoriteDetail(this.id);
  @override
  _FavoriteDetailState createState() => _FavoriteDetailState();
}

class _FavoriteDetailState extends State<FavoriteDetail> {
  @override
  Widget build(BuildContext context) {
    return buildListView(Utilities.getFavoriteBook());
  }

  GridView buildListView(List<Books> data) {
    // print(data.toString());
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return BookItem1(book: Utilities.getBookById(data[index].id));
      },
    );
  }
}
