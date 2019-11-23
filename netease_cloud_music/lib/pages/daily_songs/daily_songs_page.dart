import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/daily_songs.dart';
import 'package:netease_cloud_music/model/music.dart';
import 'package:netease_cloud_music/model/song.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_item.dart';
import 'package:netease_cloud_music/widgets/widget_play.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_app_bar.dart';
import 'package:netease_cloud_music/widgets/widget_sliver_future_builder.dart';
import 'package:provider/provider.dart';

import '../../application.dart';

class DailySongsPage extends StatefulWidget {
  @override
  _DailySongsPageState createState() => _DailySongsPageState();
}

class _DailySongsPageState extends State<DailySongsPage> {
  double _expandedHeight = ScreenUtil().setWidth(340);
  int _count;
  DailySongsData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(80) + Application.bottomBarHeight),
            child: CustomScrollView(
              slivers: <Widget>[
                PlayListAppBarWidget(
                  backgroundImg: 'images/bg_daily.png',
                  count: _count,
                  playOnTap: (model) {
                    playSongs(model, 0);
                  },
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                        margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                  '${DateUtil.formatDate(DateTime.now(), format: 'dd')} ',
                                  style: TextStyle(fontSize: 30)),
                              TextSpan(
                                  text:
                                  '/ ${DateUtil.formatDate(DateTime.now(), format: 'MM')}',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                        margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                        child: Text(
                          '根据你的音乐口味，为你推荐好音乐。',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  expandedHeight: _expandedHeight,
                  title: '每日推荐',
                ),
                CustomSliverFutureBuilder<DailySongsData>(
                  futureFunc: NetUtils.getDailySongsData,
                  builder: (context, data) {
                    setCount(data.recommend.length);
                    return Consumer<PlaySongsModel>(
                      builder: (context, model, child) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              this.data = data;
                              var d = data.recommend[index];
                              return WidgetMusicListItem(
                                MusicData(
                                    mvid: d.mvid,
                                    picUrl: d.album.picUrl,
                                    songName: d.name,
                                    artists:
                                    "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}"),
                                onTap: () {
                                  playSongs(model, index);
                                },
                              );
                            },
                            childCount: data.recommend.length,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          PlayWidget(),
        ],
      ),
    );
  }

  void playSongs(PlaySongsModel model, int index) {
    model.playSongs(
      data.recommend
          .map((r) => Song(
                r.id,
                name: r.name,
                picUrl: r.album.picUrl,
                artists: '${r.artists.map((a) => a.name).toList().join('/')}',
              ))
          .toList(),
      index: index,
    );
    NavigatorUtil.goPlaySongsPage(context);
  }

  void setCount(int count) {
    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _count = count;
        });
      }
    });
  }
}
