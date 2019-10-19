import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/model/song.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/widget_ovar_img.dart';
import 'package:netease_cloud_music/widgets/widget_play_bottom_menu.dart';
import 'package:netease_cloud_music/widgets/widget_song_progress.dart';
import 'package:provider/provider.dart';

class PlaySongsPage extends StatefulWidget {
  @override
  _PlaySongsPageState createState() => _PlaySongsPageState();
}

class _PlaySongsPageState extends State<PlaySongsPage>
    with TickerProviderStateMixin {
  AnimationController _controller;      // 封面旋转控制器
  AnimationController _stylusController; //唱针控制器
  Animation<double> _stylusAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _stylusController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _stylusAnimation = Tween<double>(begin: 0, end: -0.08).animate(_stylusController);
    _controller.addStatusListener((status) {
      // 转完一圈之后继续
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongsModel>(builder: (context, model, child) {
      var curSong = model.curSong;
      if (model.curState == AudioPlayerState.PLAYING) {
        // 如果当前状态是在播放当中，则唱片一直旋转，
        // 并且唱针是移除状态
        _controller.forward();
        _stylusController.reverse();
      } else {
        _controller.stop();
        _stylusController.forward();
      }
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Utils.showNetImage(
              curSong.picUrl,
              width: Application.screenWidth,
              height: Application.screenHeight,
              fit: BoxFit.fitHeight,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 100,
                sigmaX: 100,
              ),
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            AppBar(
              centerTitle: true,
              brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    model.curSong.name,
                    style: commonWhiteTextStyle,
                  ),
                  Text(
                    model.curSong.artists,
                    style: smallWhite70TextStyle,
                  ),
                ],
              ),
            ),
            Align(
              child: RotationTransition(
                turns: _controller,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    prefix0.Image.asset(
                      'images/bet.png',
                      width: ScreenUtil().setWidth(530),
                    ),
                    OverImgWidget(curSong.picUrl, 350),
                  ],
                ),
              ),
              alignment: Alignment(0.0, -0.3),
            ),
            Align(
              child: RotationTransition(
                turns: _stylusAnimation,
                alignment: Alignment(-1 + (ScreenUtil().setWidth(45 * 2) / (ScreenUtil().setWidth(293))), -1 + (ScreenUtil().setWidth(45 * 2) / (ScreenUtil().setWidth(504)))),
                child: Image.asset(
                  'images/bgm.png',
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setWidth(344),
                ),
              ),
              alignment: Alignment(0.24, -0.75),
            ),
            Align(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
                child: SongProgressWidget(),
              ),
              alignment: Alignment(0.0, 0.78),
            ),
            Align(
              child: PlayBottomMenuWidget(),
              alignment: Alignment(0.0, 0.95),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _stylusController.dispose();
    super.dispose();
  }
}
