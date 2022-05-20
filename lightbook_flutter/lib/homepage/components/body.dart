import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/constant/color.dart';
import 'package:lightbook_flutter/homepage/components/fragment/account_fragment.dart';
import 'package:lightbook_flutter/homepage/components/fragment/cart_fragment.dart';
import 'package:lightbook_flutter/homepage/components/fragment/home_fragment.dart';
import 'package:lightbook_flutter/homepage/components/fragment/library_fragment.dart';
import 'package:lightbook_flutter/homepage/components/fragment/music_fragment.dart';
import 'package:lightbook_flutter/homepage/components/homeheader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeFragment(),
      LibraryFragment(),
      MusicFragment(),
      CartFragment(),
      AccountFragment(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: HomeHeader(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.navbarColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex, selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            selectIndex = index;
            if (selectIndex != 4) {
              flag = true;
            } else {
              flag = false;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(Icons.library_books),
            label: 'Thư viện',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(Icons.music_note),
            label: 'Âm nhạc',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Giỏ hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(Icons.account_circle),
            label: 'Người dùng',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            screen[selectIndex]
          ],
        ),
      ),
    );
  }
}
