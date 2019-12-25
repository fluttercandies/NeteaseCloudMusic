import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';

/// 歌单、新碟上架等封面组件
class PlayListCoverWidget extends StatelessWidget {
  final String url;
  final int playCount;
  final double width;
  final double height;
  final double radius;

  PlayListCoverWidget(this.url,
      {this.playCount, this.width = 200, this.height, this.radius = 16});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(radius))),
      child: Container(
        width: ScreenUtil().setWidth(width),
        height: ScreenUtil().setWidth(height ?? width),
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Utils.showNetImage('$url?param=200y200', width: ScreenUtil().setWidth(width), height: ScreenUtil().setWidth(height ?? width), fit: BoxFit.cover),
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
    );
  }
}
