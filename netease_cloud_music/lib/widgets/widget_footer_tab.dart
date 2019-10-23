import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';

class FooterTabWidget extends StatelessWidget {
  final String img;
  final String text;
  final VoidCallback onTap;


  FooterTabWidget(this.img, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Image.asset(img, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50),),
            VEmptyView(8),
            Text(text, style: common14White70TextStyle,)
          ],
        ),
      ),
    );
  }
}
