import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/constant/color.dart';
import 'package:lightbook_flutter/widgets/text_field_input.dart';
import 'package:lightbook_flutter/widgets/widgets.dart';

class HomeHeader extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: textFieldInput(
              hintText: 'Tìm kiếm sách bạn yêu thích nhất',
              icon: Icons.search,
              controller: _searchController,
              keyboardType: TextInputType.text,
              backgroundColor: ColorConstants.searchColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "");
          },
          child: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(10),
              child: Icon(Icons.receipt_outlined)),
        )
      ],
    );
  }
}
