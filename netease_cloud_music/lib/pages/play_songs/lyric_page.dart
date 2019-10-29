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


  /// 开始下一行动画
  void startLineAnim(int curLine){
    // 判断当前行和 customPaint 里的当前行是否一致，不一致才做动画
    if(_lyricWidget.curLine != curLine){
      // 如果动画控制器不是空，那么则证明上次的动画未完成，
      // 未完成的情况下直接 stop 当前动画，做下一次的动画
      if(_lyricOffsetYController != null){
        _lyricOffsetYController.stop();
      }

      // 初始化动画控制器，切换歌词时间为300ms，并且添加状态监听，
      // 如果为 completed，则消除掉当前controller，并且置为空。
      _lyricOffsetYController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 300))..addStatusListener((status){
            if(status == AnimationStatus.completed){
              _lyricOffsetYController.dispose();
              _lyricOffsetYController = null;
            }
      });
      // 计算出来当前行的偏移量
      var end =  _lyricWidget.computeScrollY(curLine) * -1;
      // 起始为当前偏移量，结束点为计算出来的偏移量
      Animation animation = Tween<double>(begin: _lyricWidget.offsetY, end: end).animate(_lyricOffsetYController);
      // 添加监听，在动画做效果的时候给 offsetY 赋值
      _lyricOffsetYController.addListener((){
        _lyricWidget.offsetY = animation.value;
      });
      // 启动动画
      _lyricOffsetYController.forward();
      // 给 customPaint 赋值当前行
      _lyricWidget.curLine = curLine;
    }
  }
}
