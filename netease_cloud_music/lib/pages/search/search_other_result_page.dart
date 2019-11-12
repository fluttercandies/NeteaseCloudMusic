import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/music.dart';
import 'package:netease_cloud_music/model/search_result.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_album.dart';
import 'package:netease_cloud_music/widgets/widget_artists.dart';
import 'package:netease_cloud_music/widgets/widget_load_footer.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_item.dart';

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
  List<Songs> _songsData = [];
  List<Artists> _artistsData = []; // 专辑数据
  EasyRefreshController _controller;
  

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      _params = {
        'keywords': widget.keywords,
        'offset': '1',
        'type': widget.type
      };
      _request();
    });
  }

  void _request() async {
    var r = await NetUtils.searchMultiple(context, params: _params);
    if (mounted) {
      setState(() {
        switch (int.parse(widget.type)) {
          case 1: // 单曲
            _count = r.result.songCount;
            _songsData.addAll(r.result.songs);
            break;
          case 10: // 专辑
            break;
          case 100: // 歌手
            _count = r.result.artistCount;
            _artistsData.addAll(r.result.artists);
            break;
          case 1000: // 歌单
          case 1002: // 用户
          case 1004: // MV
            break;
          default:
            break;
        }
      });
    }
  }

  // 构建单曲页面
  Widget _buildSongsPage() {
    return EasyRefresh.custom(
      slivers: [
        SliverToBoxAdapter(
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
        SliverToBoxAdapter(
          child: VEmptyView(30),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var song = _songsData[index];
              return Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: WidgetMusicListItem(MusicData(
                    songName: song.name,
                    mvid: song.mvid,
                    artists:
                        song.artists.map((a) => a.name).toList().join('/'))),
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
  }

  // 构建专辑页面
  Widget _buildAlbumPage() {
    return Container();
  }

  // 构建歌手页面
  Widget _buildArtistsPage() {
    return EasyRefresh.custom(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          var curData = _artistsData[index];
          return ArtistsWidget(picUrl: curData.picUrl.isEmpty ? curData.img1v1Url : curData.picUrl, name: curData.name, accountId: curData.accountId,);
          // return AlbumWidget(
          //     curData.picUrl.isEmpty ? curData.img1v1Url : curData.picUrl,
          //     curData.name,
          //     '${curData.alias.join('/')}');
        }, childCount: _artistsData.length))
      ],
      footer: LoadFooter(),
      controller: _controller,
      onLoad: () async {
        print('load');
        _params['offset'] = '${int.parse(_params['offset']) + 1}';
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
      case 1002: // 用户
      case 1004: // MV
        result = Container();
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
