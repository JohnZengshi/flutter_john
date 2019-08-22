import 'package:flutter/material.dart';

class sideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('DrawerHeader'),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
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
    );
  }
}
