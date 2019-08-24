import 'package:flutter/material.dart';

import 'package:flutter_john/routes/commodityManagement.dart';
import 'package:flutter_john/routes/purchaseMall.dart';
import 'package:flutter_john/routes/financialManagement.dart';
import 'package:flutter_john/routes/merchantManagement.dart';
import 'package:flutter_john/routes/postsaleEngineer.dart';
import 'package:flutter_john/routes/wanjiaanCollege.dart';
import 'package:flutter_john/components/sliverStickyDelegate.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
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
      'route': commodityManagement(),
    },
    {
      'text': '采购商城',
      'icon': Icons.shop,
      'color': Colors.purple,
      'route': purchaseMall(),
    },
    {
      'text': '财务管理',
      'icon': Icons.money_off,
      'color': Colors.orange,
      'route': financialManagement(),
    },
    {
      'text': '商户管理',
      'icon': Icons.business,
      'color': Colors.green,
      'route': merchantManagement(),
    },
    {
      'text': '售后工程师',
      'icon': Icons.event_busy,
      'color': Colors.deepOrange,
      'route': postsaleEngineer(),
    },
    {
      'text': '万佳安学院',
      'icon': Icons.collections,
      'color': Colors.redAccent,
      'route': wanjiaanCollege(),
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
        child: FlatButton(
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
                functionList[index]['text'],
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return functionList[index]['route'];
            }));
          },
        ),
      );
    });
  }

  List<Widget> _buildToDoCard(int length) {
    return List.generate(length, (int index) {
      return Container(
        height: 72,
        margin: EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                offset: Offset(0.0, 4.0),
                blurRadius: 10.0,
              )
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '新订单',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '2018.04.08',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(170, 170, 170, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  '恒安安防提交了订单（零售商采购单），请尽快安排发货',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(170, 170, 170, 1),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              '今日业绩',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _buildCard(cardList.length),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 23),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: _buildFunctionList(functionList.length),
                  ),
                ),
              ],
            ),
          ),
          SliverAppBar(
            title: Text(
              '待办事项',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Row(
                  children: <Widget>[
                    Text(
                      '详情',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(170, 170, 170, 1),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color.fromRGBO(170, 170, 170, 1),
                      size: 14,
                    ),
                  ],
                ),
              )
            ],
            pinned: true,
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildListDelegate(_buildToDoCard(50)),
          ),
        ],
      ),
    );
  }
}
