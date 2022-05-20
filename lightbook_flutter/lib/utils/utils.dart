// for displaying snackbars
import 'package:flutter/material.dart';
import 'package:lightbook_flutter/models/books.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
