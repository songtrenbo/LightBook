import 'dart:convert';

import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/categories.dart';

class Utilities {
  String url = '';

  static List<Books> data = [];

  static List<Books> get5BookByCategoryId(int id) {
    return Books.init()
        .where((element) => element.categoryId == id)
        .take(5)
        .toList();
  }

  static Categories getCategoryById(int id) {
    return Categories.init().where((element) => element.id == id).first;
  }

  static Books getBookById(int id) {
    return Books.init().where((element) => element.id == id).first;
  }

  static getPopularBook() {
    return Books.init().take(5).toList();
  }

  static List<Books> getFavoriteBook() {
    return Books.init().take(4).toList();
  }

  static List<Books> getReadBookContinue() {
    return Books.init().take(4).toList();
  }
}
