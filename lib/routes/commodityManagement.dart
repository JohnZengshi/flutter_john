import 'package:flutter/material.dart';
import 'package:flutter_john/components/card.dart';

class commodityManagement extends StatefulWidget {
  @override
  _commodityManagementState createState() => _commodityManagementState();
}

class _commodityManagementState extends State<commodityManagement> {
  bool $isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品管理'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print('前往采购');
            },
            child: Text(
              '前往采购',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 14, right: 12, left: 12),
          child: Column(
            children: <Widget>[
              GoodsCard(),
              Card1(),
              Card2(),
            ],
          ),
        ),
      ),
    );
  }
}
