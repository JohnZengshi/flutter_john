import 'package:flutter/material.dart';

import 'package:flutter_john/pages/page_01.dart';
import 'package:flutter_john/pages/page_02.dart';
import 'package:flutter_john/components/sideDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pageList = [
    {
      'text': 'accessibility',
      'textColor': Colors.black,
      'barColor': Colors.white
    },
    {
      'text': 'outlined_flag',
      'textColor': Colors.white,
      'barColor': Colors.blue
    },
  ];

  int $currentIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      $currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          pageList[$currentIndex]['text'],
          style: TextStyle(color: pageList[$currentIndex]['textColor']),
        ),
        backgroundColor: pageList[$currentIndex]['barColor'],
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: pageList[$currentIndex]['textColor'],
          ),
          tooltip: 'Navigation',
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.message,
              color: pageList[$currentIndex]['textColor'],
            ),
            tooltip: 'message',
            onPressed: () => debugPrint('message'),
          ),
        ],
      ),
      body: IndexedStack(
        index: $currentIndex,
        children: [
          new page_01(),
          new page_02(),
        ],
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
