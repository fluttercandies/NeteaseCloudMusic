import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/song.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/widgets/widget_round_img.dart';
import 'package:provider/provider.dart';

class PlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongsModel>(builder: (context, model, child) {
      Song curSong = model.curSong;
      return Container(
        height: ScreenUtil().setWidth(80),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xFFF7F7F7))),
            color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        child: Row(
          children: <Widget>[
            RoundImgWidget(curSong.picUrl, 50),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(curSong.name),
                  Text(curSong.artists),
                ],
              ),
            ),
            CircularProgressIndicator(value: 0.5,),
            IconButton(icon: Icon(Icons.add), onPressed: () {},)
          ],
        ),
      );
    });
  }
}
