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
    return buildListView(Utilities.get5BookByCategoryId(widget.id));
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
