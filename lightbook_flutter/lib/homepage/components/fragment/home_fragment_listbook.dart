import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightbook_flutter/book/bookpage.dart';
import 'package:lightbook_flutter/category/category_detail_page.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/categories.dart';
import 'package:lightbook_flutter/models/utilities.dart';
import 'package:lightbook_flutter/widgets/book_item1.dart';

class ListBook extends StatefulWidget {
  int idCategory;
  ListBook({this.idCategory = 0});

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  late Future<List<Books>> futureBook;

  @override
  void initState() {
    super.initState();
    futureBook = widget.idCategory != 0
        ? Utilities().fetchBooksByCategoryId(widget.idCategory)
        : Utilities().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    final Categories? category = widget.idCategory == 0
        ? null
        : Utilities.getCategoryById(widget.idCategory);
    // print(category.id);
    final List<Books> books = widget.idCategory != 0
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
                    if (widget.idCategory != 0)
                      Navigator.pushNamed(context, CategoryDetailPage.routeName,
                          arguments: widget.idCategory);
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
              child: FutureBuilder<List<Books>>(
                future: futureBook,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, index) => BookItem1(
                        book: snapshot.data![index],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
