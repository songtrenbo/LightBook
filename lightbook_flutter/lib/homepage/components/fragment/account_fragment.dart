import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lightbook_flutter/favorite/favorite_page.dart';
import 'package:lightbook_flutter/models/books.dart';
import 'package:lightbook_flutter/models/users.dart';
import 'package:lightbook_flutter/signin/signinpage.dart';
import 'package:lightbook_flutter/widgets/book_item2.dart';
import 'package:lightbook_flutter/widgets/widgets.dart';

class AccountFragment extends StatelessWidget {
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    Users user = Users.init()[1];
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
            radius: 50,
          ),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          buttonBorderRound(
            context: context,
            nameButton: "Sách yêu thích",
            icon: Icons.favorite,
            colorIcon: Colors.red,
            onClick: () {
              Navigator.pushNamed(
                context,
                FavoritePage.routeName,
              );
            },
          ),
          buttonBorderRound(
            context: context,
            nameButton: "Sách đã mua",
            icon: Icons.book_online,
            colorIcon: Colors.indigo,
          ),
          buttonBorderRound(
            context: context,
            nameButton: "Thử thách",
            icon: Icons.star_rate,
            colorIcon: Colors.orange,
          ),
          buttonBorderRound(
            context: context,
            nameButton: "Đăng xuất",
            icon: Icons.logout,
            colorIcon: Colors.black,
            onClick: () {
              storage.delete(key: "jwt");
              Navigator.pushNamed(
                context,
                SignInPage.routeName,
              );
            },
          ),
          BookItem2(
            book: Books.init()[5],
            isShowPrice: true,
            isShowBtnFavorite: false,
          ),
          BookItem2(
            book: Books.init()[10],
            isShowPrice: true,
            isShowBtnFavorite: false,
          ),
          BookItem2(
            book: Books.init()[49],
            isShowPrice: true,
            isShowBtnFavorite: false,
          ),
        ],
      ),
    ));
  }
}
