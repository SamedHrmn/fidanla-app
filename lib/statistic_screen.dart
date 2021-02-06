import 'package:fidanla_app/core/components/base_scaffold.dart';
import 'package:fidanla_app/home_screen.dart';
import 'package:fidanla_app/profile_screen.dart';
import 'package:fidanla_app/tree_catalog_screen.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text("İSTATİSTİKLER"),
      ),
    );
  }
}
