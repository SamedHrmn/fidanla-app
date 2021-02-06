import 'package:fidanla_app/core/components/base_scaffold.dart';
import 'package:fidanla_app/home_screen.dart';
import 'package:fidanla_app/profile_screen.dart';
import 'package:fidanla_app/statistic_screen.dart';
import 'package:flutter/material.dart';

class TreeCatalogScreen extends StatefulWidget {
  @override
  _TreeCatalogScreenState createState() => _TreeCatalogScreenState();
}

class _TreeCatalogScreenState extends State<TreeCatalogScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text("KATALOG"),
      ),
    );
  }
}
