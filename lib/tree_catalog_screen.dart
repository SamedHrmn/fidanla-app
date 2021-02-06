import 'package:flutter/material.dart';

class TreeCatalogScreen extends StatefulWidget {
  @override
  _TreeCatalogScreenState createState() => _TreeCatalogScreenState();
}

class _TreeCatalogScreenState extends State<TreeCatalogScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Katalog"),
      ),
    );
  }
}
