import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:provider/provider.dart';

class PlayBottomMenuWidget extends StatefulWidget {
  @override
  _PlayBottomMenuWidgetState createState() => _PlayBottomMenuWidgetState();
}

class _PlayBottomMenuWidgetState extends State<PlayBottomMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongsModel>(
      builder: (context, model, child) {
        return Container(
          height: ScreenUtil().setWidth(150),
          child: Row(
            children: <Widget>[
              BottomMenu('images/icon_song_play_type_1.png', 80),
              BottomMenu('images/icon_song_left.png', 80),
              BottomMenu(
                model.curState != AudioPlayerState.PAUSED
                    ? 'images/icon_song_pause.png'
                    : 'images/icon_song_play.png',
                150,
                onTap: () {
                  setState(() {
                    model.pausePlay();
                  });
                },
              ),
              BottomMenu('images/icon_song_right.png', 80),
              BottomMenu('images/icon_play_songs.png', 80),
            ],
          ),
        );
      },
    );
  }
}

class BottomMenu extends StatelessWidget {
  final String img;
  final double size;
  final VoidCallback onTap;

  BottomMenu(this.img, this.size, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          img,
          width: ScreenUtil().setWidth(size),
          height: ScreenUtil().setWidth(size),
        ),
      ),
    );
  }
}
