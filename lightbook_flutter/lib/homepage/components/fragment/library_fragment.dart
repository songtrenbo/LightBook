import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/widgets/book_item2.dart';

import '../../../models/books.dart';
import '../../../models/utilities.dart';

class LibraryFragment extends StatelessWidget {
  Books book = Utilities.getBookById(2);
  late Future<List<Books>> futureBook;


  @override
  Widget build(BuildContext context) {
    futureBook = Utilities().getLibrary();
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
            // BookItem2(book: Books.init()[5],isShowRate: true,),
            // BookItem2(book: Books.init()[15],isShowRate: true,),
            // BookItem2(book: Books.init()[16],isShowRate: true,),
            // BookItem2(book: Books.init()[24],isShowRate: true,),
                FutureBuilder<List<Books>>(
          future: futureBook,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) => BookItem2(
                      book: snapshot.data![index],
                      isShowRate: true,
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
          ],
        ),
      ),
    );
  }
}
