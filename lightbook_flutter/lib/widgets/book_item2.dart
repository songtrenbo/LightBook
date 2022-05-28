import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lightbook_flutter/book/bookpage.dart';
import 'package:lightbook_flutter/constant/color.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lightbook_flutter/models/carts.dart';

class BookItem2 extends StatefulWidget {
  Books book;
  bool isShowRate;
  bool isShowBtnFavorite;
  bool isShowPrice;
  bool isShowBtnRemoveCart;
  BookItem2({
    required this.book,
    this.isShowRate = true,
    this.isShowBtnFavorite = true,
    this.isShowPrice = false,
    this.isShowBtnRemoveCart = false,
  });

  @override
  State<BookItem2> createState() => _BookItem2State();
}

class _BookItem2State extends State<BookItem2> {
  Color _colorIcon = Colors.grey;
  bool isFavorite = false;
  double rate = 2.75;
  void favorite() {
    setState(() {
      isFavorite = !isFavorite;
      _colorIcon = isFavorite ? Colors.red : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, BookPage.routeName,
          arguments: BookDetailsArguments(book: widget.book)),
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  widget.book.picture,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${widget.book.name}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      showRate(),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Tác giả",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      showBtnFavorite(),
                    ],
                  ),
                  showPrice(),
                  showBtnRemoveCart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showPrice() {
    return !widget.isShowPrice
        ? Text("")
        : Text(
            widget.book.price.toString(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.green,
            ),
          );
  }

  Widget showBtnRemoveCart() {
    return !widget.isShowBtnRemoveCart
        ? Text("")
        : ElevatedButton(
            onPressed: () {
              setState(() {
                Carts.cart.removeWhere((item) => item.id == widget.book.id);
              });
            },
            style: ElevatedButton.styleFrom(
              primary: ColorConstants.buttonColor,
            ),
            child: Text(
              "Xóa khỏi giỏ hàng",
              style: TextStyle(
                color: Colors.white,
              ),
            ));
  }

  Widget showBtnFavorite() {
    return !widget.isShowBtnFavorite
        ? Text("")
        : GestureDetector(
            onTap: favorite,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), //or 15.0
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  color: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: _colorIcon,
                    size: 25.0,
                  ),
                ),
              ),
            ),
          );
  }

  Widget showRate() {
    return !widget.isShowRate
        ? Text("")
        : Container(
            child: Row(
              children: [
                Text(
                  rate.toString(),
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                RatingBarIndicator(
                  rating: rate,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 1,
                  itemSize: 12.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          );
  }
}
