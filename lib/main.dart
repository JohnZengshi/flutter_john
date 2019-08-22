import 'package:flutter/material.dart';
import 'package:flutter_john/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white60,
      ),
    );
  }
}
