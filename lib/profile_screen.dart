import 'package:fidanla_app/core/components/base_scaffold.dart';
import 'package:fidanla_app/home_screen.dart';
import 'package:fidanla_app/statistic_screen.dart';
import 'package:fidanla_app/tree_catalog_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFIL"),
      ),
      body: Text("Profile"),
    );
  }
}
