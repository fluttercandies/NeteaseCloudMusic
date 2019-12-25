import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_round_img.dart';

import 'common_text_style.dart';
import 'h_empty_view.dart';

class SearchUserWidget extends StatelessWidget {

  final String url;
  final String name;
  final String description;


  SearchUserWidget({this.url, this.name, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
      child: Row(
        children: <Widget>[
          RoundImgWidget(
            '$url?param=150y150',
            140,
          ),
          HEmptyView(10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: common14TextStyle,
                ),
                description.isEmpty ? Container() : VEmptyView(10),
                Text(
                  description,
                  style: smallGrayTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
