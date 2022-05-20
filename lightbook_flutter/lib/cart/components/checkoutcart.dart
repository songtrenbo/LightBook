import 'package:flutter/material.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/utilities.dart';
import 'package:lightbook_flutter/widgets/book_item1.dart';

class CheckOutCart extends StatefulWidget {
  // int id;
  // CheckOutCart(this.id);
  @override
  _CheckOutCartState createState() => _CheckOutCartState();
}

class _CheckOutCartState extends State<CheckOutCart> {
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
