import 'books.dart';

class Carts {
  static List<Books> cart = Books.init().take(1).toList();
  // void addBookToCart(Books book) => cart.add(book);

  static List<Books> getCart() => cart;
}
