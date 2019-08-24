import 'package:flutter/material.dart';

class BottomMenuBar extends StatefulWidget {
  @override
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
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
