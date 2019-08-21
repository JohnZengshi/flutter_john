import 'package:flutter/material.dart';
import 'package:flutter_john/model/post.dart';

class view_01 extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white24,
      // margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          Container(
            padding: EdgeInsets.only(left: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        posts[index].title,
                        style: Theme.of(context).textTheme.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        posts[index].author,
                        style: Theme.of(context).textTheme.subhead,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        posts[index].tip,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: _listItemBuilder,
        ),
      ),
    );
  }
}
