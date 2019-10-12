import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';

class TagWidget extends StatelessWidget {

  final String tag;


  TagWidget(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(ScreenUtil().setWidth(20)),
            right: Radius.circular(ScreenUtil().setWidth(20))),
        child: Container(
          height: ScreenUtil().setWidth(40),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 30,
              sigmaX: 30,
            ),
            child: Container(
              color: Colors.white10,
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25), vertical: ScreenUtil().setWidth(5)),
              alignment: Alignment.center,
              child: Text(tag, style: smallWhiteTextStyle,),
            ),
          ),
        ),
      ),
    );
  }
}
