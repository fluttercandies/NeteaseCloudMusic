import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/model/song.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/widget_ovar_img.dart';
import 'package:provider/provider.dart';

class PlaySongsPage extends StatefulWidget {
  @override
  _PlaySongsPageState createState() => _PlaySongsPageState();
}

class _PlaySongsPageState extends State<PlaySongsPage> {
  PlaySongsModel _playSongsModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _playSongsModel = Provider.of<PlaySongsModel>(context);
//      _playSongsModel.playSong(Song(188432));
      print(_playSongsModel.allSongs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongsModel>(builder: (context, model, child) {
      var curSong = model.curSong;
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Image.network(
              curSong.picUrl,
              width: Application.screenWidth,
              height: Application.screenHeight,
              fit: BoxFit.fitHeight,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 100,
                sigmaX: 100,
              ),
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            AppBar(
              centerTitle: true,
              brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    model.curSong.name,
                    style: commonWhiteTextStyle,
                  ),
                  Text(
                    model.curSong.artists,
                    style: smallWhite70TextStyle,
                  ),
                ],
              ),
            ),
            Align(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  prefix0.Image.asset(
                    'images/bet.png',
                    width: ScreenUtil().setWidth(530),
                  ),
                  OverImgWidget(curSong.picUrl, 350),
                ],
              ),
              alignment: Alignment(0.0, -0.2),
            ),
            Align(
              child: Container(
                height: ScreenUtil().setWidth(200),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'images/icon_song_play_type_1.png',
                        width: ScreenUtil().setWidth(80),
                        height: ScreenUtil().setWidth(80),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'images/icon_song_left.png',
                        width: ScreenUtil().setWidth(80),
                        height: ScreenUtil().setWidth(80),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'images/icon_song_play.png',
                        width: ScreenUtil().setWidth(150),
                        height: ScreenUtil().setWidth(150),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'images/icon_song_right.png',
                        width: ScreenUtil().setWidth(80),
                        height: ScreenUtil().setWidth(80),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'images/icon_play_songs.png',
                        width: ScreenUtil().setWidth(80),
                        height: ScreenUtil().setWidth(80),
                      ),
                    ),
                  ],
                ),
              ),
              alignment: Alignment(0.0, 0.95),
            ),
          ],
        ),
      );
    });
  }
}
