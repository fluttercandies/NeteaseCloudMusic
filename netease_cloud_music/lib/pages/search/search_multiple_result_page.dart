import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/music.dart';
import 'package:netease_cloud_music/model/search_result.dart';
import 'package:netease_cloud_music/model/song.dart' as prefix0;
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_album.dart';
import 'package:netease_cloud_music/widgets/widget_artists.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_item.dart';
import 'package:netease_cloud_music/widgets/widget_round_img.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_cover.dart';
import 'package:netease_cloud_music/widgets/widget_search_play_list.dart';
import 'package:netease_cloud_music/widgets/widget_search_user.dart';
import 'package:netease_cloud_music/widgets/widget_search_video.dart';
import 'package:provider/provider.dart';

/// 综合搜索结果页
class SearchMultipleResultPage extends StatefulWidget {
  final String keywords;
  final ValueChanged onTapMore; // 点击更多的时候需要跳转到哪一个 tab 页
  final ValueChanged onTapSimText;

  SearchMultipleResultPage(this.keywords,
      {@required this.onTapMore, @required this.onTapSimText});

  @override
  _SearchMultipleResultPageState createState() =>
      _SearchMultipleResultPageState();
}

class _SearchMultipleResultPageState extends State<SearchMultipleResultPage>
    with AutomaticKeepAliveClientMixin {
  // 构建模块基础模板
  Widget _buildModuleTemplate(String title,
      {@required List<Widget> contentWidget,
      Widget titleTrail,
      String moreText,
      VoidCallback onMoreTextTap}) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              title,
              style: bold18TextStyle,
            ),
            Spacer(),
            titleTrail ?? Container(),
          ],
        ),
        VEmptyView(20),
        ...contentWidget,
        moreText != null ? VEmptyView(10) : Container(),
        moreText != null
            ? _buildMoreText(moreText, onMoreTextTap)
            : Container(),
      ],
    );
  }

  // 构建单曲模块
  Widget _buildSearchSongs(Song song) {
    return Consumer<PlaySongsModel>(
      builder: (context, model, child) {
        List<Widget> children = [];
        for (int i = 0; i < song.songs.length; i++) {
          children.add(WidgetMusicListItem(
            MusicData(
                songName: song.songs[i].name,
                mvid: song.songs[i].mv,
                artists:
                    song.songs[i].ar.map((a) => a.name).toList().join('/')),
            onTap: () {
              _playSongs(model, song.songs, i);
            },
          ));
        }

        return _buildModuleTemplate("单曲",
            contentWidget: [
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: children,
              ),
            ],
            titleTrail: GestureDetector(
              onTap: () {
                _playSongs(model, song.songs, 0);
              },
              child: Container(
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
            ),
            moreText: song.moreText, onMoreTextTap: () {
          widget.onTapMore(1);
        });
      },
    );
  }

  void _playSongs(PlaySongsModel model, List<Songs> data, int index) {
    model.playSongs(
      data
          .map((r) => prefix0.Song(
                r.id,
                name: r.name,
                picUrl: r.al.picUrl,
                artists: '${r.ar.map((a) => a.name).toList().join('/')}',
              ))
          .toList(),
      index: index,
    );
    NavigatorUtil.goPlaySongsPage(context);
  }

  // 构建歌单模块
  Widget _buildSearchPlayList(PlayList playList) {
    return _buildModuleTemplate('歌单',
        contentWidget: <Widget>[
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: playList.playLists.map((p) {
              return SearchPlayListWidget(
                id: p.id,
                name: p.name,
                url: p.coverImgUrl,
                playCount: p.playCount,
                info:
                    '${p.trackCount}首 by${p.creator.nickname}，播放${NumberUtils.formatNum(p.playCount)}次',
              );
            }).toList(),
          ),
        ],
        moreText: playList.moreText, onMoreTextTap: () {
      widget.onTapMore(4);
    });
  }

  // 构建视频模块
  Widget _buildSearchVideo(Video video) {
    return _buildModuleTemplate('视频',
        contentWidget: <Widget>[
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: video.videos.map((video) {
              return SearchVideoWidget(
                url: video.coverUrl,
                playCount: video.playTime,
                title: video.title,
                type: video.type,
                creatorName: video.creator.map((c) => c.userName).join('/'),
              );
            }).toList(),
          ),
        ],
        moreText: video.moreText, onMoreTextTap: () {
      widget.onTapMore(6);
    });
  }

  // 构建更多文字
  Widget _buildMoreText(String text, VoidCallback callback) {
    return GestureDetector(
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

  // 构建相关搜索模块
  Widget _buildSimQuery(SimQuery sim) {
    return sim == null || sim.sim_querys.isEmpty ? Container() :
    _buildModuleTemplate('相关搜索', contentWidget: [
      Wrap(
        spacing: ScreenUtil().setWidth(20),
        children:
        sim.sim_querys.map((v) => GestureDetector(
                  onTap: () {
                    widget.onTapSimText(v.keyword);
                  },
                  child: Chip(
                    label: Text(
                      v.keyword,
                      style: common14TextStyle,
                    ),
                    backgroundColor: Color(0xFFf2f2f2),
                  ),
                ))
            .toList(),
      ),
    ]);
  }

  Widget _buildSearchArtists(Artist artist) {
    return _buildModuleTemplate('歌手',
        contentWidget: [
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: artist.artists.map((a) {
              return ArtistsWidget(
                  picUrl: a.picUrl, name: a.name, accountId: a.accountId);
            }).toList(),
          ),
        ],
        moreText: artist.moreText, onMoreTextTap: () {
      widget.onTapMore(3);
    });
  }

  Widget _buildSearchAlbum(Album album) {
    return _buildModuleTemplate('专辑',
        contentWidget: <Widget>[
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: album.albums.map((p) {
              return AlbumWidget(p.blurPicUrl, p.name,
                  '${p.artists.map((a) => a.name).toList().join('/')} ${DateUtil.formatDateMs(p.publishTime, format: "yyyy.MM.dd")}');
            }).toList(),
          ),
        ],
        moreText: album.moreText, onMoreTextTap: () {
      widget.onTapMore(2);
    });
  }

  Widget _buildSearchUser(User user) {
    return _buildModuleTemplate('用户',
        contentWidget: <Widget>[
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: user.users.map((p) {
              return SearchUserWidget(
                name: p.nickname,
                url: p.avatarUrl,
                description: p.description,
              );
            }).toList(),
          ),
        ],
        moreText: user.moreText, onMoreTextTap: () {
      widget.onTapMore(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomFutureBuilder<SearchMultipleData>(
      futureFunc: NetUtils.searchMultiple,
      params: {'keywords': widget.keywords, 'type': 1018},
      builder: (context, data) {
        return ListView(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20),
              vertical: ScreenUtil().setWidth(20)),
          children: <Widget>[
            _buildSearchSongs(data.result.song),
            VEmptyView(20),
            _buildSearchPlayList(data.result.playList),
            VEmptyView(20),
            _buildSearchVideo(data.result.video),
            VEmptyView(20),
            _buildSimQuery(data.result.sim_query),
            VEmptyView(20),
            _buildSearchArtists(data.result.artist),
            VEmptyView(20),
            _buildSearchAlbum(data.result.album),
            VEmptyView(20),
            _buildSearchUser(data.result.user),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
