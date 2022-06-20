import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/categories.dart';
import 'package:http/http.dart' as http;
import 'package:quiver/strings.dart';

class Utilities {
  static List<Books> data = [];
  final storage = new FlutterSecureStorage();
  Future<List<Books>> fetchBooks() async {
    final response = await http.get(
      Uri.parse('https://10.0.2.2:5001/api/Book/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Books>((json) => Books.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Books>> fetchBooksByCategoryId(int categoryId) async {
    final response = await http.get(
      Uri.parse('https://10.0.2.2:5001/api/Book/category/${categoryId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Books>((json) => Books.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<String> logIn(String username, String password) async {
    var res = await http.post(
      Uri.parse('https://10.0.2.2:5001/api/User/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"userName": username, "password": password}),
    );
    if (res.statusCode == 200) return res.body;
    return "null";
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

  Future<List<Books>> getLibrary() async {
    String? tokenStr = await storage.read(key: "jwt");
    var token = json.decode(tokenStr!);
    var userId = token["userId"];
    var accessToken = token["accessToken"];
    final response = await http.get(
      Uri.parse('https://10.0.2.2:5001/api/Book/library?userid=${userId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body) as List;
      var parsedBooks = [];
      for (var i = 0; i < parsed.length; i++) {
        parsedBooks.add((parsed[i]["book"]));
      }
      return parsedBooks.map((e) => Books.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  static List<Books> getFavoriteBook() {
    return Books.init().take(4).toList();
  }

  static List<Books> getReadBookContinue() {
    return Books.init().take(4).toList();
  }
}
