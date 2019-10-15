import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/top_list.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';

const Map<String, int> TOP_LIST_CODE_MAP = {
  '云音乐新歌榜': 0,
  '云音乐热歌榜': 1,
  '网易原创歌曲榜': 2,
  '云音乐飙升榜': 3,
  '云音乐国电榜': 4,
  'UK排行榜周榜': 5,
  '美国Billboard周榜': 6,
  'KTV唛榜': 7,
  'iTunes榜': 8,
  'Hit FM Top榜': 9,
  '日本Oricon周榜': 10,
  '韩国Melon排行榜周榜': 11,
  '韩国Mnet排行榜周榜': 12,
  '韩国Melon原声周榜': 13,
  '中国TOP排行榜(港台榜)': 14,
  '中国TOP排行榜(内地榜)': 15,
  '香港电台中文歌曲龙虎榜': 16,
  '华语金曲榜': 17,
  '中国嘻哈榜': 18,
  '法国 NRJ Vos Hits 周榜': 19,
  '台湾Hito排行榜': 20,
  'Beatport全球电子舞曲榜': 21,
  '云音乐ACG动画榜': 22,
  '云音乐说唱榜': 23,
  '云音乐古典音乐榜': 24,
  '云音乐电音榜': 25,
  '抖音排行榜': 26,
  '新声榜': 27,
  '云音乐韩语榜': 28,
  '英国Q杂志中文版周榜': 29,
  '电竞音乐榜': 30,
  '云音乐欧美热歌榜': 31,
  '云音乐欧美新歌榜': 32,
  '说唱TOP榜': 33,
};

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
      body: CustomFutureBuilder<TopListData>(
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
                          print(TOP_LIST_CODE_MAP[d.name]);
                        },
                        child: Container(
                          height: ScreenUtil().setWidth(200),
                          child: Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  RoundedNetImage(
                                    d.coverImgUrl,
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
                        print(TOP_LIST_CODE_MAP[d.name]);
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
                                  d.coverImgUrl,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
