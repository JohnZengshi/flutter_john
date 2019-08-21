import 'package:flutter/material.dart';

import 'package:flutter_john/views/view_01.dart';
import 'package:flutter_john/views/view_02.dart';
import 'package:flutter_john/views/view_03.dart';

class page_01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("HELLO"),
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
            IconButton(
              icon: Icon(Icons.message),
              tooltip: 'message',
              onPressed: () => debugPrint('message'),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.flight_takeoff)),
              Tab(icon: Icon(Icons.send)),
              Tab(icon: Icon(Icons.chat)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            view_01(),
            view_02(),
            view_03(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('DrawerHeader'),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://resources.ninghao.org/images/white-dragon.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white70.withOpacity(0.5), BlendMode.hardLight),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
