import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';

class SongProgressWidget extends StatefulWidget {
  final PlaySongsModel model;

  SongProgressWidget(this.model);

  @override
  _SongProgressWidgetState createState() => _SongProgressWidgetState();
}

class _SongProgressWidgetState extends State<SongProgressWidget> {
  double curTime;
  var curTimeStr;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.model.curPositionStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var totalTime =
          snapshot.data.substring(snapshot.data.indexOf('-') + 1);
          curTime = double.parse(snapshot.data.substring(0, snapshot.data.indexOf('-')));
          curTimeStr = DateUtil.formatDateMs(curTime.toInt(), format: "mm:ss");
          return Container(
            height: ScreenUtil().setWidth(120),
            child: Row(
              children: <Widget>[
                Text(
                  curTimeStr,
                  style: smallWhiteTextStyle,
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: ScreenUtil().setWidth(2),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: ScreenUtil().setWidth(10),
                      ),
                    ),
                    child: Slider(
                      value: curTime,
                      onChanged: (data) {
                        widget.model.sinkProgress(data.toInt());
                      },
                      onChangeStart: (data) {
                        widget.model.pausePlay();
                      },
                      onChangeEnd: (data) {
                        widget.model.seekPlay(data.toInt());
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.white30,
                      min: 0,
                      max: double.parse(totalTime),
                    ),
                  ),
                ),
                Text(
                  DateUtil.formatDateMs(int.parse(totalTime), format: "mm:ss"),
                  style: smallWhite30TextStyle,
                ),
              ],
            ),
          );
        } else {
          return Container(
            height: ScreenUtil().setWidth(120),
          );
        }
      },
    );
  }
}


