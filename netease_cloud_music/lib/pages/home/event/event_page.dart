import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/event.dart';
import 'package:netease_cloud_music/model/event_content.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_load_footer.dart';
import 'package:netease_cloud_music/widgets/widget_round_img.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      _request();
    });
  }

  void _request() async {
    var r = await NetUtils.getEventData(context,
        params: lasttime == -1 ? null : {'lasttime': lasttime});
    lasttime = r.lasttime;
    _curRequestData = r.event;
    setState(() {
      _eventData.addAll(r.event);
    });
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
    if (data.pics.isEmpty) {
      picsWidget = Container();
    } else if (data.pics.length == 1) {
      picsWidget = Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(15)),
        child: Utils.showNetImage(data.pics[0].originUrl),
      );
    } else {
      if (data.pics.length >= 2 && data.pics.length < 5) crossCount = 2;
      if (data.pics.length > 4) crossCount = 3;
      picsWidget = Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(15)),
        child: GridView.custom(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossCount,
              mainAxisSpacing: ScreenUtil().setWidth(10),
              crossAxisSpacing: ScreenUtil().setWidth(10)),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return RoundedNetImage(data.pics[index].originUrl,
                fit: BoxFit.cover, radius: 5,);
          }, childCount: data.pics.length),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setWidth(15),
          horizontal: ScreenUtil().setWidth(20)),
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
                    Column(
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
                    Spacer(),
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
                Text(
                  contentData.msg,
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
    return EasyRefresh.custom(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            Event curData = _eventData[index];
            EventContent curContent =
                EventContent.fromJson(json.decode(curData.json));
            Widget contentWidget;
            // type 35：纯文字， 39：video，18：song
            switch (curData.type) {
              case 35:
                break;
              case 39:
                contentWidget = Container(
                  height: 100,
                  color: Colors.amber,
                );
                break;
              case 18:
                contentWidget = Container(
                  height: 100,
                  color: Colors.amber,
                );
                break;
            }
            return _buildCommonTemplate(curData, curContent, contentWidget);
          }, childCount: _eventData.length),
        )
      ],
      footer: LoadFooter(),
      onRefresh: () async {
        lasttime = -1;
        _eventData.clear();
        _request();
      },
      controller: _controller,
      onLoad: () async {
        _request();
        _controller.finishLoad(noMore: _curRequestData.length == 0);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
