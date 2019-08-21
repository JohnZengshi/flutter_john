import 'package:flutter/material.dart';

class bottomMenuBar extends StatefulWidget {
  @override
  _bottomMenuBarState createState() => _bottomMenuBarState();
}

class _bottomMenuBarState extends State<bottomMenuBar> {
  int $currentIndex = 0;

  void _onTapHandler(int index) {
    setState(() {
      $currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
