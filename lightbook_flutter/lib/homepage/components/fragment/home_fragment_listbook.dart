import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightbook_flutter/book/bookpage.dart';
import 'package:lightbook_flutter/category/category_detail_page.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/categories.dart';
import 'package:lightbook_flutter/models/utilities.dart';
import 'package:lightbook_flutter/widgets/book_item1.dart';

class ListBook extends StatelessWidget {
  int idCategory;
  ListBook({this.idCategory = 0});
  @override
  Widget build(BuildContext context) {
    final Categories? category =
        idCategory == 0 ? null : Utilities.getCategoryById(idCategory);
    // print(category.id);
    final List<Books> books = idCategory != 0
        ? Utilities.get5BookByCategoryId(category!.id)
        : Utilities.getPopularBook();
    // print("${books[4].name} ${books[4].id}");
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  category?.name ?? "",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    if (idCategory != 0)
                      Navigator.pushNamed(context, CategoryDetailPage.routeName,
                          arguments: idCategory);
                  },
                  child: Text(
                    category?.name == null ? "" : 'Xem tất cả',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    Books book = Utilities.getBookById(books[index].id);
                    // print("${book.id} + ${book.name}");
                    // print("++++++++${book.id} + ${book.name}++++++");
                    // print(books.length);
                    return BookItem1(book: book);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
