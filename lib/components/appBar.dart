import 'package:flutter/material.dart';

class AppBar extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
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
