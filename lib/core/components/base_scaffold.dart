import 'package:fidanla_app/home_screen.dart';
import 'package:fidanla_app/profile_screen.dart';
import 'package:fidanla_app/statistic_screen.dart';
import 'package:fidanla_app/tree_catalog_screen.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  final PreferredSizeWidget appBar;
  BaseScaffold({
    @required this.appBar,
    Key key,
  }) : super(key: key);

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold>
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
    print("CURRENT INDEX: " + selectedIndex.toString());
    return Scaffold(
      appBar: widget.appBar,
      bottomNavigationBar: TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        controller: _tabController,
        indicatorColor: Colors.black,
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.search)),
          Tab(icon: Icon(Icons.add_box)),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeScreen(),
          ProfileScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
