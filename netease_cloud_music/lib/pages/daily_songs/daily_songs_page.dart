import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/daily_songs.dart';
import 'package:netease_cloud_music/model/music.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/widgets/flexible_detail_bar.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_item.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_header.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_app_bar.dart';
import 'package:netease_cloud_music/widgets/widget_sliver_future_builder.dart';

class DailySongsPage extends StatefulWidget {
  @override
  _DailySongsPageState createState() => _DailySongsPageState();
}

class _DailySongsPageState extends State<DailySongsPage> {
  double _expandedHeight = ScreenUtil().setWidth(340);
  int _count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          PlayListAppBarWidget(
            backgroundImg: 'images/bg_daily.png',
            count: _count,
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
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var d = data.recommend[index];
                    return WidgetMusicListItem(MusicData(
                        mvid: d.mvid,
                        picUrl: d.album.picUrl,
                        songName: d.name,
                        artists:
                            "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}"));
                  },
                  childCount: data.recommend.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void setCount(int count) {
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _count = count;
      });
    });
  }
}
