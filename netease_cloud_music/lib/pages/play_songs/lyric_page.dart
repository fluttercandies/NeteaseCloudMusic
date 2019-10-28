import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/model/lyric.dart';
import 'package:netease_cloud_music/pages/play_songs/widget_lyric.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';

class LyricPage extends StatefulWidget {
  final PlaySongsModel model;

  LyricPage(this.model);

  @override
  _LyricPageState createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> with TickerProviderStateMixin{
  LyricWidget _lyricWidget;
  LyricData _lyricData;
  List<Lyric> lyrics;
  AnimationController _lyricOffsetYController;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) async {
      _lyricData = await NetUtils.getLyricData(context,
          params: {'id': widget.model.curSong.id});
      setState(() {
        lyrics = Utils.formatLyric(_lyricData.lrc.lyric);
        _lyricWidget = LyricWidget(lyrics, 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('lyric_build');

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: _lyricData == null
            ? Container()
            : GestureDetector(
                onVerticalDragUpdate: (e) {
                  _lyricWidget.offsetY += e.delta.dy;
                },
                child: StreamBuilder<String>(
                  stream: widget.model.curPositionStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var curTime = double.parse(snapshot.data.substring(0, snapshot.data.indexOf('-')));
                      // 获取当前在哪一行
                      int curLine = Utils.findLyricIndex(curTime, lyrics);
                      startLineAnim(curLine);
                      return CustomPaint(
                        size: Size(
                            Application.screenWidth,
                            Application.screenHeight -
                                kToolbarHeight -
                                ScreenUtil().setWidth(150) -
                                ScreenUtil().setWidth(50) -
                                Application.statusBarHeight -
                                ScreenUtil().setWidth(120)),
                        painter: _lyricWidget,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ));
  }


  void startLineAnim(int curLine){
    if(_lyricWidget.curLine != curLine){
      if(_lyricOffsetYController != null){
        _lyricOffsetYController.stop();
      }

      _lyricOffsetYController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 300))..addStatusListener((status){
            if(status == AnimationStatus.completed){
              _lyricOffsetYController.dispose();
              _lyricOffsetYController = null;
            }
      });
      var end =  _lyricWidget.computeScrollY(curLine) * -1;
      Animation animation = Tween<double>(begin: _lyricWidget.offsetY, end: end).animate(_lyricOffsetYController);
      _lyricOffsetYController.addListener((){
        _lyricWidget.offsetY = animation.value;
      });
      _lyricOffsetYController.forward();
      _lyricWidget.curLine = curLine;
    }
  }
}
