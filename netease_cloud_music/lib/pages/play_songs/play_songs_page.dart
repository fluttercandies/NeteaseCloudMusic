import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/model/comment_head.dart';
import 'package:netease_cloud_music/model/song.dart';
import 'package:netease_cloud_music/model/song_comment.dart';
import 'package:netease_cloud_music/pages/comment/comment_type.dart';
import 'package:netease_cloud_music/pages/play_songs/widget_lyric.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:netease_cloud_music/widgets/widget_img_menu.dart';
import 'package:netease_cloud_music/widgets/widget_round_img.dart';
import 'package:netease_cloud_music/widgets/widget_play_bottom_menu.dart';
import 'package:netease_cloud_music/widgets/widget_song_progress.dart';
import 'package:provider/provider.dart';

import 'lyric_page.dart';

class PlaySongsPage extends StatefulWidget {
  @override
  _PlaySongsPageState createState() => _PlaySongsPageState();
}

class _PlaySongsPageState extends State<PlaySongsPage>
    with TickerProviderStateMixin {
  AnimationController _controller; // 封面旋转控制器
  AnimationController _stylusController; //唱针控制器
  Animation<double> _stylusAnimation;
  int switchIndex = 0; //用于切换歌词

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _stylusController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _stylusAnimation =
        Tween<double>(begin: -0.03, end: -0.10).animate(_stylusController);
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
              '${curSong.picUrl}?param=200y200',
              width: double.infinity,
              height: double.infinity,
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
            Container(
              margin: EdgeInsets.only(top: kToolbarHeight + Application.statusBarHeight),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        setState(() {
                          if(switchIndex == 0){
                            switchIndex = 1;
                          }else{
                            switchIndex = 0;
                          }
                        });
                      },
                      child: IndexedStack(
                        index: switchIndex,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(150)),
                                  child: RotationTransition(
                                    turns: _controller,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        prefix0.Image.asset(
                                          'images/bet.png',
                                          width: ScreenUtil().setWidth(550),
                                        ),
                                        RoundImgWidget('${curSong.picUrl}?param=200y200', 370),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                child: RotationTransition(
                                  turns: _stylusAnimation,
                                  alignment: Alignment(
                                      -1 +
                                          (ScreenUtil().setWidth(45 * 2) /
                                              (ScreenUtil().setWidth(293))),
                                      -1 +
                                          (ScreenUtil().setWidth(45 * 2) /
                                              (ScreenUtil().setWidth(504)))),
                                  child: Image.asset(
                                    'images/bgm.png',
                                    width: ScreenUtil().setWidth(205),
                                    height: ScreenUtil().setWidth(352.8),
                                  ),
                                ),
                                alignment: Alignment(0.25, -1),
                              ),
                            ],
                          ),
                          LyricPage(model),
                        ],
                      ),
                    ),
                  ),

                  buildSongsHandle(model),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
                    child: SongProgressWidget(model),
                  ),
                  PlayBottomMenuWidget(model),
                  VEmptyView(20),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildSongsHandle(PlaySongsModel model) {
    return Container(
      height: ScreenUtil().setWidth(100),
      child: Row(
        children: <Widget>[
          ImageMenuWidget('images/icon_dislike.png', 80),
          ImageMenuWidget(
            'images/icon_song_download.png',
            80,
            onTap: () {},
          ),
          ImageMenuWidget(
            'images/bfc.png',
            80,
            onTap: () {},
          ),
          Expanded(
            child: Align(
              child: Container(
                width: ScreenUtil().setWidth(130),
                height: ScreenUtil().setWidth(80),
                child: CustomFutureBuilder<SongCommentData>(
                  futureFunc: NetUtils.getSongCommentData,
                  params: {'id': model.curSong.id, 'offset': 1},
                  loadingWidget: Image.asset(
                    'images/icon_song_comment.png',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setWidth(80),
                  ),
                  builder: (context, data) {
                    return GestureDetector(
                      onTap: () {
                        NavigatorUtil.goCommentPage(context, data: CommentHead(model.curSong.picUrl, model.curSong.name, model.curSong.artists, data.total, model.curSong.id, CommentType.song.index));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'images/icon_song_comment.png',
                            width: ScreenUtil().setWidth(80),
                            height: ScreenUtil().setWidth(80),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                              width: ScreenUtil().setWidth(58),
                              child: Text(
                                '${NumberUtils.formatNum(data.total)}',
                                style: common10White70TextStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          ImageMenuWidget('images/icon_song_more.png', 80),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _stylusController.dispose();
    super.dispose();
  }
}
