import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netease_cloud_music/model/lyric.dart';

class Utils {
  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }

  static Widget showNetImage(String url,
      {double width, double height, BoxFit fit}) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
    );
  }

  static List<Lyric> formatLyric(String lyricStr) {
    RegExp reg = RegExp(r"^\[\d{2}");

    List<Lyric> result = lyricStr.split("\n").where((r) => reg.hasMatch(r)).map((s) {
      String time = s.substring(0, 10);
      String lyric = s.substring(10);
      time = s.substring(1, time.length - 1);
      int hourSeparatorIndex = time.indexOf(":");
      int minuteSeparatorIndex = time.indexOf(".");
      return Lyric(
        lyric,
        startTime: Duration(
          minutes: int.parse(
            time.substring(0, hourSeparatorIndex),
          ),
          seconds: int.parse(
              time.substring(hourSeparatorIndex + 1, minuteSeparatorIndex)),
          milliseconds: int.parse(time.substring(minuteSeparatorIndex + 1)),
        ),
      );
    }).toList();

    for(int i = 0; i < result.length - 1; i++){
      result[i].endTime = result[i+1].startTime;
    }
    result[result.length - 1].endTime = Duration(hours: 1);
    return result;
  }
}
