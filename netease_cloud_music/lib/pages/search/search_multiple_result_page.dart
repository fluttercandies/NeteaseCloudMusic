import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/search_result.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/widget_future_builder.dart';

/// 综合搜索结果页
class SearchMultipleResultPage extends StatefulWidget {

  final String keywords;

  SearchMultipleResultPage(this.keywords);

  @override
  _SearchMultipleResultPageState createState() => _SearchMultipleResultPageState();
}

class _SearchMultipleResultPageState extends State<SearchMultipleResultPage> {

  // 构建单曲模块
  Widget _buildSearchSongs(Song song){
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '单曲',
              style: bold18TextStyle,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xfff2f2f2)),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.play_circle_outline, color: Colors.black87,),
                  Text('播放全部'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<SearchMultipleData>(
      futureFunc: NetUtils.searchMultiple,
      params: {
        'keywords': widget.keywords,
        'type': 1018
      },
      builder: (context, data){
        return ListView(
          children: <Widget>[
            _buildSearchSongs(data.result.song),
          ],
        );
      },
    );
  }
}
