import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class CommonStyle {
  static TextStyle smallGrayPrint = TextStyle(
    fontSize: 12,
    height: 17 / 12,
    color: Colors.grey,
  );
}

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: ScrollOnExpand(
      scrollOnExpand: false,
      scrollOnCollapse: true,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  tapHeaderToExpand: true,
                  tapBodyToCollapse: true,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "ExpandablePanel",
                        style: Theme.of(context).textTheme.body2,
                      )),
                  collapsed: Text(
                    loremIpsum,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var i in Iterable.generate(5))
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              loremIpsum,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        crossFadePoint: 0,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

    buildCollapsed1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Expandable",
                    style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
            ),
          ]);
    }

    buildCollapsed2() {
      return buildImg(Colors.lightGreenAccent, 150);
    }

    buildCollapsed3() {
      return Container();
    }

    buildExpanded1() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Expandable",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  "3 Expandable widgets",
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      );
    }

    buildExpanded2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
              Expanded(child: buildImg(Colors.orange, 100)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: buildImg(Colors.lightBlue, 100)),
              Expanded(child: buildImg(Colors.cyan, 100)),
            ],
          ),
        ],
      );
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              loremIpsum,
              softWrap: true,
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1(),
                  expanded: buildExpanded1(),
                ),
                Expandable(
                  collapsed: buildCollapsed2(),
                  expanded: buildExpanded2(),
                ),
                Expandable(
                  collapsed: buildCollapsed3(),
                  expanded: buildExpanded3(),
                ),
                Divider(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context);
                        return FlatButton(
                          child: Text(
                            controller.expanded ? "COLLAPSE" : "EXPAND",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Spec {
  List<String> specification;
  String articleNumber;
  String inStock;
  String sales;
  Spec({this.specification, this.articleNumber, this.inStock, this.sales});
}

class Header {
  String title;
  double width;
  Header({this.title, this.width});
}

class GoodsCard extends StatelessWidget {
  Widget buildSpecificationList() {
    List<Header> headerData = [
      Header(title: '规格', width: 115),
      Header(title: '货号', width: 98),
      Header(title: '库存', width: 98),
      Header(title: '销量', width: 40)
    ];
    List<Spec> specificationData = [
      Spec(
        specification: ['金色', '4k'],
        articleNumber: '123456789-1',
        inStock: '100',
        sales: '0',
      ),
      Spec(
        specification: ['金色', '4k'],
        articleNumber: '123456789-1',
        inStock: '100',
        sales: '0',
      ),
      Spec(
        specification: ['金色', '4k'],
        articleNumber: '123456789-1',
        inStock: '100',
        sales: '0',
      ),
      Spec(
        specification: ['金色', '4k'],
        articleNumber: '123456789-1',
        inStock: '100',
        sales: '0',
      )
    ];
    List<Widget> buildingTheHeader() {
      List<Widget> _header = [];
      headerData.asMap().forEach((int i, Header header) => {
            _header.add(Container(
              width: header.width,
              child: Padding(
                padding: EdgeInsets.only(
                  left: i == 0 ? 17 : 0,
                  top: 3,
                  bottom: 11,
                ),
                child: Text(
                  header.title,
                  style: TextStyle(
                    fontSize: 12,
                    height: 17 / 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ))
          });
      return _header;
    }

    List<TableRow> buildingTabularData() {
      List<TableRow> data = [];
      List<Widget> _list = [];
      specificationData.asMap().forEach((int i, Spec spec) => {
            _list = [],
            spec.specification.asMap().forEach((int i, String str) => {
                  _list.add(Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromRGBO(228, 247, 255, 1),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Text(
                          str,
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ))
                }),
            data.add(TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 11, bottom: 8),
                  child: Wrap(spacing: 6, children: _list),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(spec.articleNumber,
                      style: CommonStyle.smallGrayPrint),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(spec.inStock, style: CommonStyle.smallGrayPrint),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(spec.sales, style: CommonStyle.smallGrayPrint)),
              ],
            ))
          });
      return data;
    }

    return Table(
      children: [
        TableRow(
          children: buildingTheHeader(),
        ),
        ...buildingTabularData()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351,
      margin: EdgeInsets.only(bottom: 20),
      child: ExpandableNotifier(
        child: ScrollOnExpand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(51, 51, 51, 0.08),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(),
                  child: Container(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'http://lorempixel.com/640/480/food'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 7),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 1,
                                              horizontal: 4,
                                            ),
                                            child: Text(
                                              '智能门锁',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                height: 14 / 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '万佳安智能指纹锁防锁防盗门锁L5盗门锁L5万佳安智能指纹盗门锁L5万佳安智能指纹',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            height: 20 / 14,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          '¥1988',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                255, 152, 110, 1),
                                            height: 25 / 18,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '货号: 123456789',
                                          style: CommonStyle.smallGrayPrint,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          '门店销量: 0',
                                          style: CommonStyle.smallGrayPrint,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '门店库存库存123',
                                          style: CommonStyle.smallGrayPrint,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expandable(
                  expanded: Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(250, 250, 250, 1)),
                    child: buildSpecificationList(),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(247, 247, 247, 1),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Builder(
                                builder: (context) {
                                  return Transform.rotate(
                                    angle: pi /
                                        (ExpandableController.of(context)
                                                .expanded
                                            ? 1
                                            : 0.1),
                                    child: ExpandIcon(
                                      size: 24,
                                      onPressed: (value) {
                                        ExpandableController.of(context)
                                            .toggle();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              '已上架',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: OutlineButton(
                                onPressed: () {},
                                textColor: Colors.grey,
                                child:
                                    Text('已下架', style: TextStyle(fontSize: 12)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text('编辑'),
                                textColor: Colors.white,
                                color: Color.fromRGBO(255, 152, 110, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
