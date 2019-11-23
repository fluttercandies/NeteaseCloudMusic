import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
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
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_album.dart';
import 'package:netease_cloud_music/widgets/widget_artists.dart';
import 'package:netease_cloud_music/widgets/widget_load_footer.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_item.dart';
import 'package:netease_cloud_music/widgets/widget_search_play_list.dart';
import 'package:netease_cloud_music/widgets/widget_search_user.dart';
import 'package:netease_cloud_music/widgets/widget_search_video.dart';
import 'package:provider/provider.dart';

typedef LoadMoreWidgetBuilder<T> = Widget Function(T data);

class SearchOtherResultPage extends StatefulWidget {
  final String type;
  final String keywords;

  SearchOtherResultPage(this.type, this.keywords);

  @override
  _SearchOtherResultPageState createState() => _SearchOtherResultPageState();
}

class _SearchOtherResultPageState extends State<SearchOtherResultPage>
    with AutomaticKeepAliveClientMixin {
  int _count = -1;
  Map<String, String> _params;
  List<Songs> _songsData = []; // 单曲数据
  List<Artists> _artistsData = []; // 专辑数据
  List<Albums> _albumsData = []; // 专辑数据
  List<PlayLists> _playListData = []; // 歌单数据
  List<Users> _userListData = []; // 用户数据
  List<Videos> _videosData = []; // 视频数据
  EasyRefreshController _controller;
  int offset = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      _params = {
        'keywords': widget.keywords,
        'type': widget.type
      };
      _request();
    });
  }

  void _request() async {
    if(offset > 1) _params['offset'] = offset.toString();
    var r = await NetUtils.searchMultiple(context, params: _params);
    if (mounted) {
      setState(() {
        switch (int.parse(widget.type)) {
          case 1: // 单曲
            _count = r.result.songCount;
            _songsData.addAll(r.result.songs);
            break;
          case 10: // 专辑
            _count = r.result.albumCount;
            _albumsData.addAll(r.result.albums);
            break;
          case 100: // 歌手
            _count = r.result.artistCount;
            _artistsData.addAll(r.result.artists);
            break;
          case 1000: // 歌单
            _count = r.result.playlistCount;
            _playListData.addAll(r.result.playlists);
            break;
          case 1002: // 用户
            _count = r.result.userprofileCount;
            _userListData.addAll(r.result.userprofiles);
            break;
          case 1014: // 视频
            _count = r.result.videoCount;
            _videosData.addAll(r.result.videos);
            break;
          default:
            break;
        }
      });
    }
  }

  // 构建单曲页面
  Widget _buildSongsPage() {
    return Consumer<PlaySongsModel>(
      builder: (context, model, child) {
        return EasyRefresh.custom(
          slivers: [
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  _playSongs(model, _songsData, 0);
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.play_circle_outline,
                      color: Colors.black87,
                    ),
                    HEmptyView(10),
                    Text(
                      '播放全部',
                      style: common18TextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: VEmptyView(30),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var song = _songsData[index];
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _playSongs(model, _songsData, index);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      child: WidgetMusicListItem(MusicData(
                          songName: song.name,
                          mvid: song.mvid,
                          artists: song.artists
                              .map((a) => a.name)
                              .toList()
                              .join('/'))),
                    ),
                  );
                },
                childCount: _songsData.length,
              ),
            )
          ],
          footer: LoadFooter(),
          controller: _controller,
          onLoad: () async {
            _params['offset'] = '${int.parse(_params['offset']) + 1}';
            _request();
            _controller.finishLoad(noMore: _songsData.length >= _count);
          },
        );
      },
    );
  }

  void _playSongs(PlaySongsModel model, List<Songs> data, int index) {
    model.playSongs(
      data
          .map((r) => prefix0.Song(
                r.id,
                name: r.name,
                picUrl: r.album.picUrl.isEmpty
                    ? r.album.artist.img1v1Url
                    : r.album.picUrl,
                artists: '${r.artists.map((a) => a.name).toList().join('/')}',
              ))
          .toList(),
      index: index,
    );
    NavigatorUtil.goPlaySongsPage(context);
  }

  // 构建专辑页面
  Widget _buildAlbumPage() {
    return _buildLoadMoreWidget<Albums>(_albumsData, (curData) {
      return AlbumWidget(
          curData.picUrl, curData.name, '${curData.artist.name}');
    });
  }

  // 构建歌手页面
  Widget _buildArtistsPage() {
    return _buildLoadMoreWidget<Artists>(_artistsData, (curData) {
      return ArtistsWidget(
        picUrl: curData.picUrl.isEmpty ? curData.img1v1Url : curData.picUrl,
        name: curData.name,
        accountId: curData.accountId,
      );
    });
  }

  // 构建歌单页面
  Widget _buildPlayListPage() {
    return _buildLoadMoreWidget<PlayLists>(_playListData, (curData) {
      return SearchPlayListWidget(
        id: curData.id,
        url: curData.coverImgUrl,
        name: curData.name,
        playCount: curData.playCount,
        info:
            '${curData.trackCount}首 by${curData.creator.nickname}，播放${NumberUtils.formatNum(curData.playCount)}次',
        width: 110,
      );
    });
  }

  // 构建用户页面
  Widget _buildUserPage() {
    return _buildLoadMoreWidget<Users>(_userListData, (curData) {
      return SearchUserWidget(
        url: curData.avatarUrl,
        name: curData.nickname,
        description: curData.description,
      );
    });
  }

  // 构建专辑页面
  Widget _buildVideoPage() {
    return _buildLoadMoreWidget<Videos>(_videosData, (video) {
      return SearchVideoWidget(
        url: video.coverUrl,
        playCount: video.playTime,
        title: video.title,
        type: video.type,
        creatorName: video.creator.map((c) => c.userName).join('/'),
      );
    });
  }

  Widget _buildLoadMoreWidget<T>(
      List<T> data, LoadMoreWidgetBuilder<T> builder) {
    return EasyRefresh.custom(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return builder(data[index]);
        }, childCount: data.length))
      ],
      footer: LoadFooter(),
      controller: _controller,
      onLoad: () async {
        offset++;
        _request();
        _controller.finishLoad(noMore: _songsData.length >= _count);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_count == -1) {
      return CupertinoActivityIndicator();
    }

    Widget result;

    switch (int.parse(widget.type)) {
      case 1: // 单曲
        result = _buildSongsPage();
        break;
      case 10: // 专辑
        result = _buildAlbumPage();
        break;
      case 100: // 歌手
        result = _buildArtistsPage();
        break;
      case 1000: // 歌单
        result = _buildPlayListPage();
        break;
      case 1002: // 用户
        result = _buildUserPage();
        break;
      case 1014: // 视频
        result = _buildVideoPage();
        break;
      default:
        result = Container();
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(20),
          vertical: ScreenUtil().setWidth(20)),
      child: result,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
