import 'package:flutter/material.dart';
import 'package:gank_flutter/page/fun_read_page.dart';
import 'package:gank_flutter/page/girl_page.dart';
import 'package:gank_flutter/page/gank_page.dart';
import 'package:gank_flutter/page/my_page.dart';

/// 创建时间：2019/5/8
///作者：chenkang
/// 描述：主界面

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex;
  var titleList = ['主页', '分类', '妹子', '我的'];
  List<Widget> pages = List<Widget>()
    ..add(GankPage())
    ..add(FunReadPage())
    ..add(GirlPage())
    ..add(MyPage());

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.lightBlue,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  title: Text(
                    '干活',
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.widgets,
                  ),
                  title: Text(
                    '闲读',
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.image,
                  ),
                  title: Text(
                    '妹子',
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.contacts,
                  ),
                  title: Text(
                    '我的',
                  )),
            ]),
        floatingActionButton: FloatingActionButton(
          elevation: 5.0,
          tooltip: 'Increment',
          child: Icon(Icons.arrow_upward),
        ), // This trailing comma m
      ),
    );
  }
}
