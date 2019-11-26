import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:netease_cloud_music/model/event.dart';
import 'package:netease_cloud_music/model/event_content.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/widget_load_footer.dart';

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
  Widget _buildCommonTemplate(Event data, Widget content){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RoundedNetImage(data.user.avatarUrl, width: 40,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(

              ),
            ],
          ),
        )
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
            EventContent curContent = EventContent.fromJson(json.decode(curData.json));
            // type 35：纯文字， 39：video，18：song
            switch (curData.type) {
              case 35:

                break;
              case 39:
                break;
              case 18:
                break;
            }
            return Container();
          }, childCount: _eventData.length),
        )
      ],
      footer: LoadFooter(),
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
