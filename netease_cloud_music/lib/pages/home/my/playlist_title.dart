import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';

/// 构建歌单标题
class PlaylistTitle extends StatefulWidget {
  final String title;
  final int count;
  final VoidCallback onSwitchTap;
  final VoidCallback onMoreTap;
  final Widget trailing;

  PlaylistTitle(this.title, this.count, this.onSwitchTap, this.onMoreTap,
      {this.trailing});

  @override
  _PlaylistTitleState createState() => _PlaylistTitleState();
}

class _PlaylistTitleState extends State<PlaylistTitle> {
  List<String> arrows = [
    'images/icon_down.png',
    'images/icon_up.png',
  ];
  String arrow;


  @override
  void initState() {
    super.initState();
    arrow = arrows[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(80),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            if (arrow == arrows[0])
              arrow = arrows[1];
            else
              arrow = arrows[0];
            widget.onSwitchTap();
          });
        },
        child: Row(
          children: <Widget>[
            AnimatedSwitcher(
              transitionBuilder: (child, anim) {
                return ScaleTransition(child: child, scale: anim);
              },
              duration: Duration(milliseconds: 300),
              child: Image.asset(
                arrow,
                key: ValueKey(arrow),
                width: ScreenUtil().setWidth(30),
              ),
            ),
            HEmptyView(10),
            Text(
              widget.title,
              style: bold18TextStyle,
            ),
            HEmptyView(5),
            Text(
              '(${widget.count})',
              style: common14GrayTextStyle,
            ),
            Spacer(),
            widget.trailing ?? Container(),
            SizedBox(
              height: ScreenUtil().setWidth(50),
              width: ScreenUtil().setWidth(70),
              child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black87,
                ),
                onPressed: widget.onMoreTap,
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
