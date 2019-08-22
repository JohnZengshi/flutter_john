import 'package:flutter/material.dart';

import 'package:flutter_john/views/view_01.dart';
import 'package:flutter_john/views/view_02.dart';
import 'package:flutter_john/views/view_03.dart';

class page_01 extends StatefulWidget {
  @override
  _page_01State createState() => _page_01State();
}

class _page_01State extends State<page_01> {
  var cardList = [
    {
      'text': '订单金额',
      'menony': '453.00',
      'color': Color.fromRGBO(30, 163, 255, 1),
    },
    {
      'text': '订单数',
      'menony': '400',
      'color': Color.fromRGBO(93, 120, 255, 1),
    },
    {
      'text': '工单收益',
      'menony': '526.00',
      'color': Color.fromRGBO(255, 152, 110, 1),
    },
    {
      'text': '统计金额',
      'menony': '600',
      'color': Color.fromRGBO(39, 210, 159, 1),
    },
  ];
  var functionList = [
    {
      'text': '商品管理',
      'icon': Icons.stay_primary_portrait,
      'color': Colors.blueGrey,
    },
    {
      'text': '采购商城',
      'icon': Icons.shop,
      'color': Colors.purple,
    },
    {
      'text': '财务管理',
      'icon': Icons.money_off,
      'color': Colors.orange,
    },
    {
      'text': '商户管理',
      'icon': Icons.business,
      'color': Colors.green,
    },
    {
      'text': '售后工程师',
      'icon': Icons.event_busy,
      'color': Colors.deepOrange,
    },
    {
      'text': '万佳安学院',
      'icon': Icons.collections,
      'color': Colors.redAccent,
    },
  ];
  List<Widget> _buildCard(int length) {
    return List.generate(length, (int index) {
      return Container(
        margin: EdgeInsets.only(right: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            //背景渐变
            color: cardList[index]['color'],
            borderRadius: BorderRadius.circular(8.0), //3像素圆角
          ),
          child: Container(
            width: 106.0,
            height: 76.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  cardList[index]['text'],
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  cardList[index]['menony'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  List<Widget> _buildFunctionList(int length) {
    return List.generate(length, (int index) {
      return Container(
        width: 62,
        child: Column(
          children: <Widget>[
            Container(
              width: 48,
              height: 48,
              margin: EdgeInsets.only(bottom: 8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(51, 51, 51, 0.08),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Icon(
                  functionList[index]['icon'],
                  color: functionList[index]['color'],
                ),
              ),
            ),
            Text(
              '商品管理',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8),
          Text(
            '今日业绩',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildCard(cardList.length),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 23, left: 8, right: 8),
            child: Wrap(
              spacing: 34,
              runSpacing: 24,
              children: _buildFunctionList(functionList.length),
            ),
          )
        ],
      ),
    );
  }
}
