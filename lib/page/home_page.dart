import 'package:flutter/material.dart';

/// 创建时间：2019/5/8
///作者：chenkang
/// 描述：

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 4.0,
          pinned: true,
          expandedHeight: 200,
          title: Text('date'),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
//            title: Text('Demo'),
            background: Image.asset(
              "assets/images/avatar.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Banner(
            message: 'haha',
            location: BannerLocation.bottomStart,
            child: Container(
              height: 200,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 10),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            //创建列表项
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: new Text('list item $index'),
            );
          }, childCount: 50 //50个列表项
                  ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      height: 300.0,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => null;

  @override
  // TODO: implement minExtent
  double get minExtent => null;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
