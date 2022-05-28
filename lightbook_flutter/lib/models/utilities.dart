import 'dart:convert';

import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/categories.dart';
import 'package:http/http.dart' as http;
import 'package:quiver/strings.dart';

class Utilities {

  static List<Books> data = [];

  Future<List<Books>> fetchBooks() async {
    final response =
        await http.get(Uri.parse('https://10.0.2.2:5001/api/Book/all'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      // print(response.body);

      return parsed.map<Books>((json) => Books.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Books>> fetchBooksByCategoryId(int categoryId) async {
    final response =
        await http.get(Uri.parse('https://10.0.2.2:5001/api/Book/${categoryId}'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      // print(response.body);

      return parsed.map<Books>((json) => Books.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

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
