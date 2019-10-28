import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/pages/play_songs/widget_lyric.dart';
import 'package:netease_cloud_music/utils/utils.dart';

class LyricPage extends StatefulWidget {
  @override
  _LyricPageState createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> {
  LyricWidget _lyricWidget;

  @override
  void initState() {
    super.initState();
    _lyricWidget = LyricWidget(Utils.formatLyric(
        "[by:莎士比亚书店]\n[00:24.50]Nobody ever knows\n[00:27.20]Nobody ever sees\n[00:30.03]I left my soul\n[00:32.72]Back then, no I'm too weak\n[00:35.51]Most nights I pray for you to come home\n[00:41.46]Praying to the lord\n[00:44.50]Praying for my soul\n[00:46.44]Now please don't go\n[00:52.52]Most nights I hardly sleep when I'm alone\n[00:57.71]Now please don't go, oh no\n[01:03.65]I think of you whenever I'm alone\n[01:07.98]So please don't go\n[01:20.92]'Cause I don't ever wanna know\n[01:24.38]Don't ever want to see things change\n[01:27.10]'Cause when I'm living on my own\n[01:29.81]I wanna take it back and start again\n[01:32.64]Most nights I pray for you to come home\n[01:38.70]I'm praying to the lord\n[01:41.56]I'm praying for my soul\n[01:44.78]Now please don't go\n[01:51.41]Most nights I hardly sleep\n[01:53.75]When I'm alone\n[01:56.28]Now please don't go, oh no\n[02:02.40]I think of you whenever I'm alone\n[02:06.27]So please don't go\n[02:10.53]I sent so many messages\n[02:12.66]You don't reply\n[02:15.63]Gotta feel around, what am I missing babe?\n[02:18.81]Singing now, oh oh oh\n[02:21.98]I need you now, I need your love, oh\n[02:32.09]Now please don't go\n[02:37.69]I said most nights I hardly sleep\n[02:40.87]When I'm alone\n[02:43.42]Now please don't go, oh no\n[02:49.32]I think of you whenever I'm alone\n[02:53.51]So please don't go\n[02:55.30]So please don't go\n[02:59.31]So please don't go\n[03:06.67]So please don't go\n[03:12.26]I think of you whenever I'm alone\n[03:16.38]So please don't go\n"));
  }

  @override
  Widget build(BuildContext context) {
    print(Size(
        Application.screenWidth,
        Application.screenHeight -
            kToolbarHeight -
            ScreenUtil().setWidth(150) -
            ScreenUtil().setWidth(50) -
            Application.statusBarHeight -
            ScreenUtil().setWidth(120)));
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onVerticalDragUpdate: (e) {
            print('drag');
            _lyricWidget.offsetY += e.delta.dy;
          },
          child: CustomPaint(
            size: Size(
                Application.screenWidth,
                Application.screenHeight -
                    kToolbarHeight -
                    ScreenUtil().setWidth(150) -
                    ScreenUtil().setWidth(50) -
                    Application.statusBarHeight -
                    ScreenUtil().setWidth(120)),
            painter: _lyricWidget,
          ),
        ));
  }
}
