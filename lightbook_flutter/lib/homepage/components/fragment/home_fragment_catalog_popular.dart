import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/homepage/components/fragment/home_fragment_listbook.dart';
import 'package:lightbook_flutter/models/users.dart';
import 'package:lightbook_flutter/models/utilities.dart';
import 'package:lightbook_flutter/widgets/book_item2.dart';

import '../../../models/books.dart';

class PopularFragment extends StatefulWidget {
  @override
  State<PopularFragment> createState() => _PopularFragmentState();
}

class _PopularFragmentState extends State<PopularFragment> {
  final user = Users.init()[1];

  late Future<List<Books>> futureBook;

  @override
  void initState() {
    super.initState();
    futureBook = Utilities().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListBook(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Tiếp tục đọc",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder<List<Books>>(
          future: futureBook,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) => BookItem2(
                      book: snapshot.data![index],
                      isShowRate: false,
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
    );
  }
}
