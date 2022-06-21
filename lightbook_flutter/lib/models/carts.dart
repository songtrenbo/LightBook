import 'package:flutter/cupertino.dart';

import '../widgets/widgets.dart';
import 'books.dart';

class Carts {
  static List<Books> cart = [];
  // void addBookToCart(Books book) => cart.add(book);
  static Future<bool?> AddBookToCart(Books book) {
    if (book.price == 0) {
      return toastNotify("Sách đã có trong giỏ hàng");
    }
    if (cart.where((element) => element.id == book.id).toList().isNotEmpty) {
      return toastNotify("Sách đã có trong giỏ hàng");
      // return;
    }
    cart.add(book);
    return toastNotify("Thêm vào giỏ hàng thành công");
  }

  static List<Books> getCart() => cart;
}
