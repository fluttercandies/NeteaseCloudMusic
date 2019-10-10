import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayListWidget extends StatelessWidget {
  final String picUrl;
  final String text;
  final String subText;
  final num playCount;
  final int maxLines;
  final VoidCallback onTap;

  PlayListWidget({
    @required this.picUrl,
    @required this.text,
    this.playCount,
    this.subText,
    this.onTap,
    this.maxLines = -1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenUtil().setWidth(200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Container(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setWidth(200),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Image.network(picUrl),
                    playCount == null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setWidth(2),
                                right: ScreenUtil().setWidth(5)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'images/icon_triangle.png',
                                  width: ScreenUtil().setWidth(30),
                                  height: ScreenUtil().setWidth(30),
                                ),
                                Text(
                                  '${NumberUtils.amountConversion(playCount)}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ),
            VEmptyView(5),
            Text(
              text,
              style: smallCommonTextStyle,
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
            subText == null ? Container() : VEmptyView(2),
            subText == null
                ? Container()
                : Text(
                    subText,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                    maxLines: maxLines != -1 ? maxLines : null,
                    overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
                  ),
          ],
        ),
      ),
    );
  }
}
