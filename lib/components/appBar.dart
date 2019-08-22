import 'package:flutter/material.dart';

class appBar extends StatefulWidget {
  @override
  _appBarState createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  int $currentIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      $currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        unselectedLabelColor: Colors.black54,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3.0,
        onTap: _onTapHandler,
        tabs: <Widget>[
          Tab(icon: Icon(Icons.flight_takeoff)),
          Tab(icon: Icon(Icons.send)),
          Tab(icon: Icon(Icons.offline_bolt)),
        ],
      ),
      color: Theme.of(context).accentColor,
    );
  }
}
