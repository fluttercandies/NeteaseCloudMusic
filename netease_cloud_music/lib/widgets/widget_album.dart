import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';

import 'common_text_style.dart';
import 'h_empty_view.dart';

class AlbumWidget extends StatelessWidget {
  final String albumCoverUrl;
  final String albumName;
  final String albumInfo;

  AlbumWidget(this.albumCoverUrl, this.albumName, this.albumInfo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
      child: Row(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RoundedNetImage(
                '$albumCoverUrl?param=150y150',
                width: 140,
                height: 140,
                radius: 8,
              ),
              Image.asset(
                'images/icon_album.png',
                height: ScreenUtil().setWidth(140),
              )
            ],
          ),
          HEmptyView(10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  albumName,
                  style: common14TextStyle,
                ),
                VEmptyView(10),
                Text(
                  albumInfo,
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
