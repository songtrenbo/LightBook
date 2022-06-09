import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lightbook_flutter/book/components/addtocart.dart';
import 'package:lightbook_flutter/constant/color.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/carts.dart';
import 'package:lightbook_flutter/widgets/book_item2.dart';

import '../../models/utilities.dart';

class Body extends StatefulWidget {
  Books book;

  Body({required this.book});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Color _colorIcon = Colors.grey;
  bool isFavorite = false;
  void favorite() {
    setState(() {
      isFavorite = !isFavorite;
      _colorIcon = isFavorite ? Colors.red : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 64, 16, 0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.book.picture),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
        color: Colors.black12,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.black.withOpacity(.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: favorite,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(30.0), //or 15.0
                                child: Container(
                                  height: 55.0,
                                  width: 55.0,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.favorite,
                                    color: _colorIcon,
                                    size: 45.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: .5, color: const Color(0xFFFFFFFF)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.network(
                                  widget.book.picture,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Carts.cart.add(widget.book);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(30.0), //or 15.0
                                child: Container(
                                  height: 55.0,
                                  width: 55.0,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.grey,
                                    size: 45.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: ColorConstants.buttonColor,
                          ),
                          child: Text(
                            "Review",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 16.0,
                        direction: Axis.horizontal,
                      ),
                      Text(
                        widget.book.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(widget.book.review),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Reviews",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "Tiếp tục đọc",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: ListView.builder(
                  itemCount: Utilities.getReadBookContinue().length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BookItem2(
                      book: Utilities.getReadBookContinue()[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
