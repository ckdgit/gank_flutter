import 'package:flutter/material.dart';

/// 创建时间：2019/5/8
///作者：chenkang
/// 描述：主界面

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  var titleList = ['主页','分类','妹子','我的'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: Text('haha'),
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
                    '主页',
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.widgets,
                  ),
                  title: Text(
                    '分类',
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
        appBar: AppBar(
          title: Text(titleList[_currentIndex]),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 5.0,
          tooltip: 'Increment',
          child: Icon(Icons.arrow_upward),
        ), // This trailing comma m
      ),
    );
  }
}
