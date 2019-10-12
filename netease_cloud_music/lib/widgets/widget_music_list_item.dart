import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/music.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';

import '../application.dart';
import 'common_text_style.dart';
import 'h_empty_view.dart';

class WidgetMusicListItem extends StatelessWidget {
  final MusicData _data;

  WidgetMusicListItem(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Application.screenWidth,
      height: ScreenUtil().setWidth(140),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HEmptyView(20),
          _data.picUrl == null
              ? Container()
              : RoundedNetImage(
                  _data.picUrl,
                  width: 100,
                  height: 100,
                  radius: 5,
                ),
          _data.index == null
              ? Container()
              : Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setWidth(50),
                  child: Text(_data.index.toString(), style: mGrayTextStyle,),
                ),
          HEmptyView(10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _data.songName,
                  style: commonTextStyle,
                ),
                VEmptyView(20),
                Text(
                  _data.artists,
                  style: smallGrayTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: _data.mvid == 0
                ? Container()
                : IconButton(
                    icon: Icon(Icons.play_circle_outline),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
