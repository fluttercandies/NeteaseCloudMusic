import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/music.dart';
import 'package:netease_cloud_music/model/search_result.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_item.dart';
import 'package:provider/provider.dart';

/// 综合搜索结果页
class SearchMultipleResultPage extends StatefulWidget {
  final String keywords;

  SearchMultipleResultPage(this.keywords);

  @override
  _SearchMultipleResultPageState createState() =>
      _SearchMultipleResultPageState();
}

class _SearchMultipleResultPageState extends State<SearchMultipleResultPage> {
  // 构建单曲模块
  Widget _buildSearchSongs(Song song) {
    return Consumer<PlaySongsModel>(
      builder: (context, model, child) {
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '单曲',
                  style: bold18TextStyle,
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(15),
                      vertical: ScreenUtil().setWidth(5)),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xfff2f2f2)),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.play_circle_outline,
                        color: Colors.black87,
                      ),
                      HEmptyView(2),
                      Text(
                        '播放全部',
                        style: common14TextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: song.songs
                  .map((song) => WidgetMusicListItem(MusicData(
                      songName: song.name,
                      mvid: song.mv,
                      artists: song.ar.map((a) => a.name).toList().join('/'))))
                  .toList(),
            ),
            _buildMoreText(song.moreText, (){}),
          ],
        );
      },
    );
  }

  Widget _buildSearchPlayList(PlayList playList) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Text(
          '歌单',
          style: bold18TextStyle,
        ),
        VEmptyView(20),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: playList.playLists.map((p) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
              child: Row(
                children: <Widget>[
                  RoundedNetImage(
                    p.coverImgUrl,
                    width: ScreenUtil().setWidth(250),
                    height: ScreenUtil().setWidth(250),
                    radius: ScreenUtil().setWidth(8),
                  ),
                  HEmptyView(10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(p.name, style: common14TextStyle,),
                      VEmptyView(10),
                      Text(
                          '${p.trackCount}首 by${p.creator.nickname}，播放${NumberUtils.formatNum(p.playCount)}次', style: smallGrayTextStyle,),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        _buildMoreText(playList.moreText,(){}),
      ],
    );
  }

  Widget _buildMoreText(String text, VoidCallback callback){
    return
      GestureDetector(
        onTap: callback,
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                text,
                style: common14GrayTextStyle,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              )
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<SearchMultipleData>(
      futureFunc: NetUtils.searchMultiple,
      params: {'keywords': widget.keywords, 'type': 1018},
      builder: (context, data) {
        return ListView(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20),
              vertical: ScreenUtil().setWidth(10)),
          children: <Widget>[
            _buildSearchSongs(data.result.song),
            VEmptyView(30),
            _buildSearchPlayList(data.result.playList),
          ],
        );
      },
    );
  }
}
