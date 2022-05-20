import 'package:flutter/material.dart';
import 'package:lightbook_flutter/models/carts.dart';
import 'package:lightbook_flutter/widgets/book_item2.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final books = Carts.getCart();
    return Expanded(
      child: Container(
        child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookItem2(
                book: books[index],
                isShowPrice: true,
                isShowBtnRemoveCart: true,
                isShowBtnFavorite: false,
                isShowRate: false,
              );
            }),
      ),
    );
  }
}
