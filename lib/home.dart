import 'package:flutter/material.dart';

import 'package:flutter_john/pages/page_01.dart';
import 'package:flutter_john/pages/page_02.dart';
import 'package:flutter_john/components/sideDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _pagesList = [
    new page_01(),
    new page_02(),
  ];
  int $currentIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      $currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("accessibility"),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation',
          onPressed: () => debugPrint('Navigation'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: () => debugPrint('search'),
          ),
        ],
      ),
      body: IndexedStack(
        index: $currentIndex,
        children: _pagesList,
      ),
      drawer: sideDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: $currentIndex,
        onTap: _onTapHandler,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            title: Text('accessibility'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.outlined_flag),
            title: Text('outlined_flag'),
          )
        ],
      ),
    );
  }
}
