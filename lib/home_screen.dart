import 'package:fidanla_app/core/components/base_scaffold.dart';
import 'package:fidanla_app/profile_screen.dart';
import 'package:fidanla_app/statistic_screen.dart';
import 'package:fidanla_app/tree_catalog_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        controller: _tabController,
        indicatorColor: Colors.black,
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.search)),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProfileScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
