import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/widgets/widget_img_menu.dart';

class PlayBottomMenuWidget extends StatelessWidget {

  final PlaySongsModel model;

  PlayBottomMenuWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(150),
      alignment: Alignment.topCenter,
      child: Row(
        children: <Widget>[
          ImageMenuWidget('images/icon_song_play_type_1.png', 80),
          ImageMenuWidget(
            'images/icon_song_left.png',
            80,
            onTap: () {
              model.prePlay();
            },
          ),
          ImageMenuWidget(
            model.curState != AudioPlayerState.PAUSED
                ? 'images/icon_song_pause.png'
                : 'images/icon_song_play.png',
            150,
            onTap: () {
              model.togglePlay();
            },
          ),
          ImageMenuWidget(
            'images/icon_song_right.png',
            80,
            onTap: () {
              model.nextPlay();
            },
          ),
          ImageMenuWidget('images/icon_play_songs.png', 80),
        ],
      ),
    );
  }
}


