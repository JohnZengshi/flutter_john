import 'package:flutter/material.dart';

import 'package:flutter_john/views/view_01.dart';
import 'package:flutter_john/views/view_02.dart';
import 'package:flutter_john/views/view_03.dart';

class page_01 extends StatefulWidget {
  @override
  _page_01State createState() => _page_01State();
}

class _page_01State extends State<page_01> {
  int $currentIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      $currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: PreferredSize(
            child: Container(
              child: TabBar(
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3.0,
                onTap: _onTapHandler,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.flight_takeoff)),
                  Tab(icon: Icon(Icons.send)),
                  Tab(icon: Icon(Icons.chat)),
                ],
              ),
              color: Theme.of(context).accentColor,
            ),
            preferredSize: Size.fromHeight(46),
          ),
          body: TabBarView(
            children: <Widget>[
              view_01(),
              view_02(),
              view_03(),
            ],
          ),
        ),
      ),
    );
  }
}
