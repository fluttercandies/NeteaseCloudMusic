import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/model/play_list.dart';
import 'package:netease_cloud_music/model/song_detail.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/flexible_detail_bar.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_header.dart';
import 'package:netease_cloud_music/widgets/widget_ovar_img.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_app_bar.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_cover.dart';

class PlayListPage extends StatefulWidget {
  final String title;
  final int id;

  PlayListPage(this.title, this.id);

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  double _expandedHeight = ScreenUtil().setWidth(600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomFutureBuilder<SongDetailData>(
        futureFunc: NetUtils.getPlayListData,
        params: {'id': widget.id},
        builder: (context, data) {
          return CustomScrollView(
            slivers: <Widget>[
              PlayListAppBarWidget(
                sigma: 20,
                content: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(35),
                      right: ScreenUtil().setWidth(35),
                      top: ScreenUtil().setWidth(120),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            PlayListCoverWidget(
                              data.playlist.coverImgUrl,
                              width: 240,
                              playCount: data.playlist.playCount,
                            ),
                            HEmptyView(20),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    widget.title,
                                    softWrap: true,
                                    maxLines: 2,
                                    style: mWhiteBoldTextStyle,
                                  ),
                                  VEmptyView(10),
                                  Row(
                                    children: <Widget>[
                                      OverImgWidget(
                                          data.playlist.creator.avatarUrl, 50),
                                      HEmptyView(5),
                                      Text(
                                        data.playlist.creator.nickname,
                                        style: commonWhite70TextStyle,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white70,
                                      ),
                                    ],
                                  ),
                                  VEmptyView(10),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          data.playlist.description,
                                          style: smallWhite70TextStyle,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white70,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                expandedHeight: _expandedHeight,
                backgroundImg: data.playlist.coverImgUrl,
                title: widget.title,
              ),
            ],
          );
        },
      ),
    );
  }
}
