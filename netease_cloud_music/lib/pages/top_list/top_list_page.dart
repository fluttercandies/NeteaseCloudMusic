import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/recommend.dart';
import 'package:netease_cloud_music/model/top_list.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:netease_cloud_music/widgets/widget_play.dart';

import '../../application.dart';

class TopListPage extends StatefulWidget {
  @override
  _TopListPageState createState() => _TopListPageState();
}

class _TopListPageState extends State<TopListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('排行榜'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          CustomFutureBuilder<TopListData>(
            futureFunc: NetUtils.getTopListData,
            builder: (context, data) {
              var officialTopListData =
              data.list.where((l) => l.tracks.isNotEmpty).toList(); // 官方榜的数据
              var moreTopListData =
              data.list.where((l) => l.tracks.isEmpty).toList(); // 更多榜单的数据

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(40),
                          left: ScreenUtil().setWidth(40)),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Text(
                            '官方榜',
                            style: bold20TextStyle,
                          );
                        } else {
                          var d = officialTopListData[index - 1];
                          var i = 1; //排行榜名次
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (){
                              toPlayListPage(d);
                            },
                            child: Container(
                              height: ScreenUtil().setWidth(200),
                              child: Row(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      RoundedNetImage(
                                        '${d.coverImgUrl}?param=150y150',
                                        width: 200,
                                        height: 200,
                                        radius: 5,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Image.asset(
                                          "images/ck.9.png",
                                          width: ScreenUtil().setWidth(200),
                                          height: ScreenUtil().setWidth(80),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                        child: Text(
                                          d.updateFrequency,
                                          style: smallWhiteTextStyle,
                                        ),
                                        left: ScreenUtil().setWidth(10),
                                        bottom: ScreenUtil().setWidth(10),
                                      )
                                    ],
                                  ),
                                  HEmptyView(20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: d.tracks.map((t) {
                                        return Container(
                                          alignment: Alignment.centerLeft,
                                          height: ScreenUtil().setWidth(65),
                                          child: Text(
                                            '${i++}.${t.first} - ${t.second}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: common13TextStyle,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      itemCount: officialTopListData.length + 1,
                      separatorBuilder: (context, index) {
                        return VEmptyView(20);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(60),
                          bottom: ScreenUtil().setWidth(30),
                          left: ScreenUtil().setWidth(40)),
                      child: Text(
                        '更多榜单',
                        style: bold20TextStyle,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, childAspectRatio: 1 / 1.2),
                      itemBuilder: (context, index) {
                        var d = moreTopListData[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            toPlayListPage(d);
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    RoundedNetImage(
                                      '${d.coverImgUrl}?param=150y150',
                                      width: 200,
                                      height: 200,
                                      radius: 5,
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Image.asset(
                                        "images/ck.9.png",
                                        width: ScreenUtil().setWidth(200),
                                        height: ScreenUtil().setWidth(80),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      child: Text(
                                        d.updateFrequency,
                                        style: smallWhiteTextStyle,
                                      ),
                                      left: ScreenUtil().setWidth(10),
                                      bottom: ScreenUtil().setWidth(10),
                                    )
                                  ],
                                ),
                                VEmptyView(10),
                                Container(
                                  child: Text(d.name, style: common13TextStyle,),
                                  width: ScreenUtil().setWidth(200),),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: moreTopListData.length,
                    ),
                    Container(
                      height: ScreenUtil().setWidth(80)
                    ),
                  ],
                ),
              );
            },
          ),
          PlayWidget(),
        ],
      ),
    );
  }

  void toPlayListPage(TopList data){
    NavigatorUtil.goPlayListPage(context, data: Recommend(picUrl: data.coverImgUrl, name: data.name, playcount: data.playCount, id: data.id));
  }
}
