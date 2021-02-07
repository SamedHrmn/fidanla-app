import 'package:fidanla_app/home_screen.dart';
import 'package:fidanla_app/profile_screen.dart';

import 'package:fidanla_app/tree_catalog_screen.dart';
import 'package:flutter/material.dart';

class TabbarRouter extends StatefulWidget {
  @override
  _TabbarRouterState createState() => _TabbarRouterState();
}

class _TabbarRouterState extends State<TabbarRouter>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.pink,
        controller: _tabController,
        indicatorColor: Colors.pink,
        tabs: [
          Tab(
              icon: Icon(
            Icons.home,
          )),
          Tab(icon: Icon(Icons.assistant_photo_outlined)),
          Tab(icon: Icon(Icons.account_circle_rounded)),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeScreen(),
          TreeCatalogScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
