import 'package:flutter/material.dart';

/// 创建时间：2019/5/8
///作者：chenkang
/// 描述：

class GankPage extends StatefulWidget {
  @override
  _GankPageState createState() => _GankPageState();
}

class _GankPageState extends State<GankPage>
    with SingleTickerProviderStateMixin {
  var _timer = new DateTime.now();
  var _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child: SliverAppBar(
              elevation: 4.0,
              pinned: true,
              expandedHeight: 200,
              title: GestureDetector(
                child: Text('date$_timer'),
                onTap: () {
                  chooseDate(context);
                },
              ),
              actions: <Widget>[
                Icon(Icons.search),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.asset(
                  "assets/images/avatar.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              bottom: TabBar(
                  controller: _controller,
                  tabs: ['Android', 'ios', 'App']
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList()),
            ),
          ),
        ];
      },
//        SliverToBoxAdapter(
//          child: Banner(
//            message: 'haha',
//            location: BannerLocation.bottomStart,
//            child: Container(
//              height: 200,
//            ),
//          ),
//        ),
//        SliverPadding(
//          padding: EdgeInsets.only(top: 10),
//        ),
      body: TabBarView(
          controller: _controller,
          children: ['Android', 'ios', 'App'].map((e) {
            return Builder(
              builder: (BuildContext context) =>
                  CustomScrollView(slivers: <Widget>[
                    SliverOverlapInjector(
                      // This is the flip side of the SliverOverlapAbsorber above.
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverFixedExtentList(
                      itemExtent: 50.0,
                      delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        //创建列表项
                        return new Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: new Text('list item $index'),
                        );
                      }, childCount: 50 //50个列表项
                          ),
                    ),
                  ]),
            );
          }).toList()),
    );
  }

  chooseDate(BuildContext context) async {
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: _timer,
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      locale: Localizations.localeOf(context),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    setState(() {
      _timer = selectedDate;
    });
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
