import 'package:aspectd/aspectd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

///创建时间：2019-07-16
///作者：chenkang
///描述：AOP逻辑

@Aspect()
@pragma("vm:entry-point")
class ExecuteDemo{
  @pragma("vm:entry-point")
  ExecuteDemo();

  @Execute("package:gank_flutter/page/gank_page.dart","_GankPageState","-build")
  @pragma("vm:entry-point")
  Widget build(PointCut pointcut) {
    Widget temp = pointcut.proceed();
    print('Aspectd:ckkkkkkkk');
    return temp;
  }

//  @Execute("package:flutter/src/gestures/tap.dart","TapGestureRecognizer","-_checkUp")
//  @pragma("vm:entry-point")
//  void _checkUp(PointCut pointcut) {
//    pointcut.proceed();
//    print('Aspectd:ckkkkkkkk---Execute');
//  }on


  @Inject("package:flutter/src/gestures/tap.dart","TapGestureRecognizer","-_checkUp",lineNum: 374)
  @pragma("vm:entry-point")
  static void tapup() {
//    Object onTap;//Aspectd Ignore
//    Object debugOwner;//Aspectd Ignore
//    TapGestureRecognizer;
    print('Aspectd:ckkkkkkkk---Inject');
//    print('Aspectd:ckkkkkkkk---Inject${(TapGestureRecognizer)this.onTap.toString()}');
  }
}