import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gank_flutter/utils/date_covert_util.dart';

/// 创建时间：2019/5/8
///作者：chenkang
/// 描述：

class GankPage extends StatefulWidget {
  @override
  _GankPageState createState() => _GankPageState();
}

class _GankPageState extends State<GankPage>
    with SingleTickerProviderStateMixin {
  var _timer = DateTime.now();
  var _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                elevation: 4.0,
                backgroundColor: Colors.blueGrey[400],
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
                    background: Swiper(
                      autoplay: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          'assets/images/avatar.jpeg',
                          fit: BoxFit.cover,
                        );
                      },
                    )),
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
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return itemBuilder(index);
                    }, childCount: 20),
                  ),
                ]),
              );
            }).toList()),
      ),
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

  Widget itemBuilder(int index) {
    return Card(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blue.withAlpha(30),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 5.0)),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    '${DateCovert.timeToDate(_timer.toString(), 'yyyy-MM-dd HH:mm')}',
                    style: TextStyle(color: Colors.black26),
                  )),
                  Text(
                    '20',
                    style: TextStyle(color: Colors.black26),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  '这是一个测试的vvvvvvvvvvv到达vvvvvvvvvvvvvvvvvccccccccc数据$index',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Row(
                children: <Widget>[
                  Text('作者  '),
                  Expanded(
                      child: Text(
                    '你大爷',
                    style: TextStyle(),
                  )),
                  Text('github'),
                ],
              )
            ],
          ),
        ),
      ),
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
