import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/model/hot_search.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget _buildHistorySearch() {
    return Offstage(
      offstage: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '历史记录',
                  style: bold18TextStyle,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.grey,
                ),
                onPressed: () {},
              )
            ],
          ),
          Wrap(
            spacing: ScreenUtil().setWidth(20),
            children: <Widget>[
              Chip(
                label: Text(
                  "Please Dont't Go",
                  style: common14TextStyle,
                ),
                backgroundColor: Color(0xFFf2f2f2),
              ),
              Chip(
                label: Text(
                  "林俊杰",
                  style: common14TextStyle,
                ),
                backgroundColor: Color(0xFFf2f2f2),
              ),
              Chip(
                label: Text(
                  "周杰伦",
                  style: common14TextStyle,
                ),
                backgroundColor: Color(0xFFf2f2f2),
              ),
              Chip(
                label: Text(
                  "野狼disco",
                  style: common14TextStyle,
                ),
                backgroundColor: Color(0xFFf2f2f2),
              ),
              Chip(
                label: Text(
                  "大田后生仔",
                  style: common14TextStyle,
                ),
                backgroundColor: Color(0xFFf2f2f2),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHostSearch() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '热搜榜',
          style: bold18TextStyle,
        ),
        VEmptyView(15),
        CustomFutureBuilder<HotSearchData>(
          futureFunc: NetUtils.getHotSearchData,
          builder: (context, data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var curData = data.data[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${index + 1}',
                        style: index < 3
                            ? bold18RedTextStyle
                            : bold18GrayTextStyle,
                      ),
                      HEmptyView(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setWidth(5)),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    curData.searchWord,
                                    style: index < 3
                                        ? w500_18TextStyle
                                        : common18TextStyle,
                                  ),
                                  Offstage(
                                      offstage: curData.iconUrl == null,
                                      child: HEmptyView(10)),
                                  Offstage(
                                      offstage: curData.iconUrl == null,
                                      child: UnconstrainedBox(
                                        child: Utils.showNetImage(curData.iconUrl,
                                            height: ScreenUtil().setHeight(25),),
                                      )),
                                  Spacer(),
                                  Text(
                                    curData.score.toString(),
                                    style: common14GrayTextStyle,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              curData.content,
                              style: common15GrayTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
//
//                return ListTile(
//                  contentPadding: EdgeInsets.zero,
//                  dense: true,
//                  leading: Text(index.toString(), style: index < 3 ? bold16RedTextStyle : bold16GrayTextStyle,),
//                  title: Text(curData.searchWord, style: index < 3 ? bold16TextStyle : common16TextStyle,),
//                  subtitle: Text(curData.content, style: common14GrayTextStyle,),
//                );
              },
              itemCount: data.data.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Theme(
          child: TextField(
            cursorColor: Colors.red,
            decoration: InputDecoration(
                hintText: "林俊杰", hintStyle: commonGrayTextStyle),
          ),
          data: Theme.of(context).copyWith(primaryColor: Colors.black54),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(40),
            vertical: ScreenUtil().setWidth(30)),
        children: <Widget>[
          _buildHistorySearch(),
          VEmptyView(50),
          _buildHostSearch(),
        ],
      ),
    );
  }
}
