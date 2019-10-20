import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageMenuWidget extends StatelessWidget {
  final String img;
  final double size;
  final VoidCallback onTap;

  ImageMenuWidget(this.img, this.size, {this.onTap});

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