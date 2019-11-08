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
  List<String> historySearchList;
  TextEditingController _searchController = TextEditingController();
  FocusNode _blankNode = FocusNode();

  @override
  void initState() {
    super.initState();
    historySearchList = Application.sp.getStringList("search_history") ?? [];
  }

  Widget _buildHistorySearch() {
    return Offstage(
      offstage: historySearchList.isEmpty,
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
                onPressed: () {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      content: Text("确定清空全部历史记录？", style: common14GrayTextStyle,),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('取消'),
                          textColor: Colors.red,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              historySearchList.clear();
                              Application.sp.remove("search_history");
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('清空'),
                          textColor: Colors.red,
                        ),
                      ],
                    );
                  });
                },
              )
            ],
          ),
          Wrap(
            spacing: ScreenUtil().setWidth(20),
            children: historySearchList
                .map((v) => Chip(
                      label: Text(
                        v,
                        style: common14TextStyle,
                      ),
                      backgroundColor: Color(0xFFf2f2f2),
                    ))
                .toList(),
          ),
          VEmptyView(50),
        ],
      ),
    );
  }

  // 热搜
  Widget _buildHotSearch() {
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
                                        ? w500_16TextStyle
                                        : common16TextStyle,
                                  ),
                                  Offstage(
                                      offstage: curData.iconUrl == null,
                                      child: HEmptyView(10)),
                                  Offstage(
                                      offstage: curData.iconUrl == null,
                                      child: UnconstrainedBox(
                                        child: Utils.showNetImage(
                                          curData.iconUrl,
                                          height: ScreenUtil().setHeight(18),
                                        ),
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
                              style: common13GrayTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
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

  // 保存搜索的文字
  void _saveSearchText(String searchText){
    setState(() {
      if(historySearchList.contains(searchText)) historySearchList.remove(searchText);
      historySearchList.insert(0, searchText);
      if(historySearchList.length > 5){
        historySearchList.removeAt(historySearchList.length - 1);
      }
      _searchController.text = "";
    });
    Application.sp.setStringList("search_history", historySearchList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Theme(
          child: TextField(
            controller: _searchController,
            cursorColor: Colors.red,
            textInputAction: TextInputAction.search,
            onEditingComplete: (){
              var searchText = _searchController.text.isEmpty ? '林俊杰' : _searchController.text;
              _saveSearchText(searchText);
            },
            decoration: InputDecoration(
                hintText: "林俊杰", hintStyle: commonGrayTextStyle),
          ),
          data: Theme.of(context).copyWith(primaryColor: Colors.black54),
        ),
      ),
      body: Listener(
        onPointerDown: (d){
          FocusScope.of(context).requestFocus(_blankNode);
        },
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(40),
              vertical: ScreenUtil().setWidth(30)),
          children: <Widget>[
            _buildHistorySearch(),
            _buildHotSearch(),
          ],
        ),
      ),
    );
  }
}
