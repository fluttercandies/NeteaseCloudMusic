import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:netease_cloud_music/model/event.dart';
import 'package:netease_cloud_music/model/event_content.dart';
import 'package:netease_cloud_music/model/song.dart' as prefix0;
import 'package:netease_cloud_music/utils/event_special_text_span_builder.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_event_song.dart';
import 'package:netease_cloud_music/widgets/widget_event_video.dart';
import 'package:netease_cloud_music/widgets/widget_load_footer.dart';
import 'package:netease_cloud_music/widgets/widget_round_img.dart';

import '../../look_img_page.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;
  FocusNode _blankNode = FocusNode();
  List<Event> _eventData = []; // 动态数据
  List<Event> _curRequestData = []; // 当前请求回来的动态数据，如果为空的话则代表没有数据了

  int lasttime = -1;
  EventRepository eventRepository = EventRepository();

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  // 构建动态通用的模板（头像、粉丝等）
  Widget _buildCommonTemplate(
      Event data, EventContent contentData, Widget content) {
    TextSpan textSpan = TextSpan(
      children: [
        TextSpan(text: data.user.nickname, style: common14BlueTextStyle),
      ],
    );
    // type 35：纯文字， 39：video，18：song
    switch (data.type) {
      case 35:
        break;
      case 39:
        textSpan.children.add(
          TextSpan(text: ' 分享视频：', style: common14TextStyle),
        );
        break;
      case 18:
        textSpan.children.add(
          TextSpan(text: ' 分享单曲：', style: common14TextStyle),
        );
        break;
    }
    Widget title = RichText(text: textSpan);

    Widget picsWidget; // 图片widget
    int crossCount;
    List<BuildContext> picsContexts = [];

    if (data.pics.isEmpty) {
      picsWidget = Container();
    } else if (data.pics.length == 1) {
      picsWidget = Builder(builder: (context) {
        picsContexts.add(context);
        return GestureDetector(
          onTap: () {
            NavigatorUtil.goLookImgPage(
                context, data.pics.map((p) => p.originUrl).toList(), 0);

//            Navigator.push(context, LookImgRoute(data.pics.map((p) => p.originUrl).toList(), 0, picsContexts));
          },
          child: Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setWidth(15)),
            child: Utils.showNetImage(data.pics[0].originUrl),
          ),
        );
      });
    } else {
      if (data.pics.length >= 2 && data.pics.length < 5) crossCount = 2;
      if (data.pics.length > 4) crossCount = 3;

      picsWidget = Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(15)),
        child: GridView.custom(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossCount,
              mainAxisSpacing: ScreenUtil().setWidth(10),
              crossAxisSpacing: ScreenUtil().setWidth(10)),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            var w = Builder(
              builder: (context) {
                picsContexts.add(context);
                return GestureDetector(
                  onTap: () {
                    NavigatorUtil.goLookImgPage(context,
                        data.pics.map((p) => p.originUrl).toList(), index);
//                  Navigator.push(context, LookImgRoute(data.pics.map((p) => p.originUrl).toList(), index, picsContexts));
                  },
                  child: Hero(
                    tag: '${data.pics[index].originUrl}$index',
                    child: RoundedNetImage(
                      data.pics[index].originUrl,
                      fit: BoxFit.cover,
                      radius: 5,
                    ),
                  ),
                );
              },
            );
            return w;
          }, childCount: data.pics.length),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setWidth(15),
          horizontal: ScreenUtil().setWidth(30)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RoundImgWidget(
            data.user.avatarUrl,
            80,
          ),
          HEmptyView(10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          title,
                          VEmptyView(5),
                          Text(
                            DateUtil.formatDateMs(data.eventTime,
                                format: 'MM月dd日 HH:mm'),
                            style: smallGrayTextStyle,
                          ),
                        ],
                      ),
                    ),
                    data.user.followed
                        ? Chip(
                            label: Text(
                              '取消关注',
                              style: common14WhiteTextStyle,
                            ),
                            backgroundColor: Colors.red,
                          )
                        : Chip(
                            labelPadding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(15)),
                            avatar: Icon(
                              Icons.add,
                              size: ScreenUtil().setWidth(30),
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.red,
                            label: Text(
                              '关注',
                              style: common14WhiteTextStyle,
                            ))
                  ],
                ),
                VEmptyView(10),
                contentData == null
                    ? Container()
                    : ExtendedText(
                        contentData.msg ?? "",
                        specialTextSpanBuilder: EventSpecialTextSpanBuilder(),
                        style: TextStyle(
                            fontSize: 15, color: Colors.black87, height: 1.5),
                      ),
                picsWidget,
                content == null
                    ? Container()
                    : Padding(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setWidth(15)),
                        child: content,
                      ),
                VEmptyView(20),
                _buildCommonBottomBar(data),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 构建通用底部bar
  Widget _buildCommonBottomBar(Event data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'images/icon_event_share.png',
                width: ScreenUtil().setWidth(35),
              ),
              HEmptyView(5),
              Text(
                data.info.shareCount.toString(),
                style: common13GrayTextStyle,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'images/icon_event_comment.png',
                width: ScreenUtil().setWidth(35),
              ),
              HEmptyView(5),
              Text(
                data.info.commentCount.toString(),
                style: common13GrayTextStyle,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'images/icon_event_commend.png',
                width: ScreenUtil().setWidth(35),
              ),
              HEmptyView(5),
              Text(
                data.info.likedCount.toString(),
                style: common13GrayTextStyle,
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicator(
      child: LoadingMoreList(ListConfig<Event>(
          collectGarbage: (List<int> garbages) {
            garbages.forEach((index) {
              eventRepository[index]
                  .pics
                  .map((p) => p.originUrl)
                  .toList()
                  .forEach((url) {
                final provider = ExtendedNetworkImageProvider(url);
                provider.evict();
              });
            });
          },
          itemBuilder: (context, curData, index) {
            EventContent curContent;
            Widget contentWidget;
            // type 35：纯文字， 39：video，18：song
            switch (curData.type) {
              case 35:
                break;
              case 39:
                curContent = EventContent.fromJson(json.decode(curData.json));
                contentWidget = EventVideoWidget(curContent.video);
                break;
              case 18:
                curContent = EventContent.fromJson(json.decode(curData.json));
                contentWidget = EventSongWidget(prefix0.Song(curContent.song.id,
                    name: curContent.song.name,
                    picUrl: curContent.song.album.picUrl,
                    artists:
                        curContent.song.artists.map((a) => a.name).join('/')));
                break;
              default:
                curContent = EventContent.fromJson(json.decode(curData.json));
                break;
            }
            return _buildCommonTemplate(curData, curContent, contentWidget);
          },
          sourceList: eventRepository)),
      onRefresh: () async {
        await eventRepository.refresh();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
