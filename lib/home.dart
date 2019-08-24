import 'package:flutter/material.dart';

import 'package:flutter_john/pages/home.dart';
import 'package:flutter_john/pages/order.dart';
import 'package:flutter_john/pages/workOrder.dart';
import 'package:flutter_john/pages/mine.dart';
import 'package:flutter_john/components/sideDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageList = [
    {
      'text': '首页',
      'textColor': Colors.black,
      'barColor': Colors.white,
      'icon': Icon(Icons.home),
      'page': home(),
    },
    {
      'text': '订单',
      'textColor': Colors.white,
      'barColor': Colors.blue,
      'icon': Icon(Icons.pages),
      'page': order(),
    },
    {
      'text': '工单',
      'textColor': Colors.white,
      'barColor': Colors.blue,
      'icon': Icon(Icons.work),
      'page': workOrder(),
    },
    {
      'text': '我的',
      'textColor': Colors.white,
      'barColor': Colors.blue,
      'icon': Icon(Icons.person),
      'page': mine(),
    },
  ];

  int $currentIndex = 0;

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem(int length) {
    return List.generate(length, (int index) {
      return BottomNavigationBarItem(
        icon: pageList[index]['icon'],
        title: Text(pageList[index]['text']),
      );
    });
  }

  List<Widget> _buildPageWidget(int length) {
    return List.generate(length, (int index) {
      return pageList[index]['page'];
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
        children: _buildPageWidget(pageList.length),
      ),
      drawer: SideDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: $currentIndex,
        onTap: (int index) {
          setState(() {
            $currentIndex = index;
          });
        },
        items: _buildBottomNavigationBarItem(pageList.length),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
