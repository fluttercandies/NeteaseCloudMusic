import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netease_cloud_music/model/play_list.dart';
import 'package:netease_cloud_music/model/recommend.dart';
import 'package:netease_cloud_music/pages/home/my/playlist_title.dart';
import 'package:netease_cloud_music/provider/user_model.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/widget_create_play_list.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  Map<String, String> topMenuData = {
    '本地音乐': 'images/icon_music.png',
    '最近播放': 'images/icon_late_play.png',
    '下载管理': 'images/icon_download_black.png',
    '我的电台': 'images/icon_broadcast.png',
    '我的收藏': 'images/icon_collect.png',
  };

  List<String> topMenuKeys;
  bool selfPlayListOffstage = false;
  bool collectPlayListOffstage = false;
  List<Playlist> playListData;

  @override
  void initState() {
    super.initState();
    topMenuKeys = topMenuData.keys.toList();
  }

  Widget _buildTopMenu() {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var curKey = topMenuKeys[index];
        var curValue = topMenuData[topMenuKeys[index]];
        return Container(
          height: ScreenUtil().setWidth(110),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(140),
                child: Align(
                  child: Image.asset(
                    curValue,
                    width: ScreenUtil().setWidth(100),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  curKey,
                  style: commonTextStyle,
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(140)),
          height: ScreenUtil().setWidth(0.3),
        );
      },
      itemCount: 5,
    );
  }

  /// 构建「我创建的歌单」「收藏的歌单」
  Widget _buildPlayListItem(List<Playlist> data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var curPlayList = data[index];
          return ListTile(
            onTap: () {
              NavigatorUtil.goPlayListPage(context,
                  data: Recommend(
                      picUrl: curPlayList.coverImgUrl,
                      name: curPlayList.name,
                      playcount: curPlayList.playCount,
                      id: curPlayList.id));
            },
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(5)),
              child: Text(curPlayList.name),
            ),
            subtitle: Text(
              '${curPlayList.trackCount}首',
              style: smallGrayTextStyle,
            ),
            leading: RoundedNetImage(
              curPlayList.coverImgUrl,
              width: 110,
              height: 110,
              radius: ScreenUtil().setWidth(12),
            ),
            trailing: SizedBox(
              height: ScreenUtil().setWidth(50),
              width: ScreenUtil().setWidth(70),
              child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            ),
          );
        },
        itemCount: data.length);
  }

  Widget _realBuildPlayList(UserModel model){
    var selfCreatePlayList = playListData
        .where((p) => p.creator.userId == model.user.account.id)
        .toList();
    var collectPlayList = playListData
        .where((p) => p.creator.userId != model.user.account.id)
        .toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PlaylistTitle("创建的歌单", selfCreatePlayList.length, () {
          setState(() {
            selfPlayListOffstage = !selfPlayListOffstage;
          });
        }, () {},
            trailing: SizedBox(
              height: ScreenUtil().setWidth(50),
              width: ScreenUtil().setWidth(70),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black87,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CreatePlayListWidget(
                          submitCallback: (name, isPrivate) {
                            _createPlaylist(name, isPrivate);
                          },
                        );
                      });
                },
                padding: EdgeInsets.zero,
              ),
            )),
        Offstage(
          offstage: selfPlayListOffstage,
          child: _buildPlayListItem(selfCreatePlayList),
        ),
        PlaylistTitle(
          "收藏的歌单",
          collectPlayList.length,
              () {
            setState(() {
              collectPlayListOffstage = !collectPlayListOffstage;
            });
          },
              () {},
        ),
        Offstage(
          offstage: collectPlayListOffstage,
          child: _buildPlayListItem(collectPlayList),
        ),
      ],
    );
  }

  /// 构建歌单
  Widget _buildPlayList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
      child: Consumer<UserModel>(
        builder: (context, model, child) {
          return CustomFutureBuilder<MyPlayListData>(
            futureFunc: NetUtils.getSelfPlaylistData,
            params: {'uid': model.user.account.id},
            builder: (context, data) {
              playListData = data.playlist;
              return _realBuildPlayList(model);
            },
          );
        },
      ),
    );
  }

  /// 创建歌单
  void _createPlaylist(String name, bool isPrivate) async {
    NetUtils.createPlaylist(context,
            params: {'name': name, 'privacy': isPrivate ? '10' : null})
        .catchError((e) {
      Utils.showToast('创建失败');
    }).then((result) {
      Utils.showToast('创建成功');
      Navigator.of(context).pop();
      setState(() {
        playListData.add(result.playlist..creator = playListData[0].creator);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTopMenu(),
            Container(
              color: Color(0xfff5f5f5),
              height: ScreenUtil().setWidth(25),
            ),
            _buildPlayList(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
