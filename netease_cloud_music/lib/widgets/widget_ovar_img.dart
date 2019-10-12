import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverImgWidget extends StatelessWidget {
  final String img;
  final double width;


  OverImgWidget(this.img, this.width);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: img.startsWith('http')
          ? Image.network(
              img,
              width: ScreenUtil().setWidth(width),
              height: ScreenUtil().setWidth(width),
            )
          : Image.asset(img),
    );
  }
}
