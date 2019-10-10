import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedNetImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;

  RoundedNetImage(this.url, {this.width, this.height, this.radius = 10});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Image.network(
        url,
        width: ScreenUtil().setWidth(width),
        height: ScreenUtil().setWidth(height),
      ),
    );
  }
}
