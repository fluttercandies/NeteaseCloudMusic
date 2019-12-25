import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_cover.dart';

import 'common_text_style.dart';
import 'h_empty_view.dart';

class SearchVideoWidget extends StatelessWidget {
  final String url;
  final int playCount;
  final int type;
  final String title;
  final String creatorName;

  SearchVideoWidget(
      {this.url, this.playCount, this.type, this.title, this.creatorName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
      child: Row(
        children: <Widget>[
          PlayListCoverWidget(
            '$url?param=200y150',
            playCount: playCount,
            width: 250,
            height: 150,
            radius: 8,
          ),
          HEmptyView(10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: type == 0
                            ? Container(
                                child: Text(
                                  'MV',
                                  style: common10RedTextStyle,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(8),
                                    vertical: ScreenUtil().setWidth(2)),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            ScreenUtil().setWidth(6)))),
                              )
                            : Container(),
                      ),
                      WidgetSpan(child: type == 0 ? HEmptyView(6) : Container()),
                      TextSpan(
                        text: title,
                        style: common14TextStyle,
                      ),
                    ],
                  ),
                ),
                VEmptyView(10),
                Text(
                  creatorName,
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
