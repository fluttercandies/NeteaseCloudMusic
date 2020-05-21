import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/user_detail.dart';
import 'package:netease_cloud_music/provider/user_model.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:netease_cloud_music/widgets/widget_play.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_app_bar.dart';
import 'package:netease_cloud_music/widgets/widget_sliver_future_builder.dart';
import 'package:provider/provider.dart';

import '../../application.dart';

class UserDetailPage extends StatefulWidget {
  final int userId;
  UserDetailPage({Key key, @required this.userId}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  double _expandedHeight = 500.w;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(bottom: 80.w + Application.bottomBarHeight),
            child: CustomFutureBuilder<UserDetailData>(
              futureFunc: NetUtils.getUserInfo,
              params: {'uid': widget.userId},
              builder: (context, data) {
                return CustomScrollView(
                  slivers: <Widget>[
                    PlayListAppBarWidget(
                      backgroundImg: 'images/bg_daily.png',
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(40)),
                            margin: EdgeInsets.only(
                                bottom: ScreenUtil().setWidth(5)),
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
                            padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(40)),
                            margin: EdgeInsets.only(
                                bottom: ScreenUtil().setWidth(20)),
                            child: Text(
                              '根据你的音乐口味，为你推荐好音乐。',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                      expandedHeight: _expandedHeight,
                      title: '每日推荐',
                    )
                  ],
                );
              },
            ),
          ),
          PlayWidget(),
        ],
      ),
    );
    ;
  }
}
