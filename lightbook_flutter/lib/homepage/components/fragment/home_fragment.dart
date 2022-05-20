import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lightbook_flutter/homepage/components/fragment/home_fragment_catalog.dart';
import 'package:lightbook_flutter/homepage/components/fragment/home_fragment_listbook.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CatalogFragment(),
    );
  }
}
