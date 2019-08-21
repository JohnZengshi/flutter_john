import 'package:flutter/material.dart';
// import 'package:flutter_john/components/bottomMenuBar.dart';
import 'package:flutter_john/pages/pages_01.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white60,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _pagesList = [
    new page_01(),
    new page_01(),
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
      body: new page_01(),
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
