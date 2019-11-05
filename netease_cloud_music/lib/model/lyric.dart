import 'dart:convert' show json;
import 'package:flutter/foundation.dart';


class Lyric{
  String lyric;
  Duration startTime;
  Duration endTime;
  double offset;

  Lyric(this.lyric, {this.startTime, this.endTime, this.offset});

  @override
  String toString() {
    return 'Lyric{lyric: $lyric, startTime: $startTime, endTime: $endTime}';
  }

}


dynamic convertValueByType(value, Type type, {String stack: ""}) {
  if (value == null) {
//    debugPrint("$stack : value is null");
    if (type == String) {
      return "";
    } else if (type == int) {
      return 0;
    } else if (type == double) {
      return 0.0;
    } else if (type == bool) {
      return false;
    }
    return null;
  }

  if (value.runtimeType == type) {
    return value;
  }
  var valueS = value.toString();
  debugPrint("$stack : ${value.runtimeType} is not $type type");
  if (type == String) {
    return valueS;
  } else if (type == int) {
    return int.tryParse(valueS);
  } else if (type == double) {
    return double.tryParse(valueS);
  } else if (type == bool) {
    valueS = valueS.toLowerCase();
    var intValue = int.tryParse(valueS);
    if (intValue != null) {
      return intValue == 1;
    }
    return valueS == "true";
  }
}

void tryCatch(Function f) {
  try {
    f?.call();
  } catch (e, stack) {
    debugPrint("$e");
    debugPrint("$stack");
  }
}

class LyricData {
  bool sgc;
  bool sfy;
  bool qfy;
  TransUser transUser;
  LyricUser lyricUser;
  Lrc lrc;
  Klyric klyric;
  Tlyric tlyric;
  int code;

  LyricData({
    this.sgc,
    this.sfy,
    this.qfy,
    this.transUser,
    this.lyricUser,
    this.lrc,
    this.klyric,
    this.tlyric,
    this.code,
  });

  factory LyricData.fromJson(jsonRes) => jsonRes == null
      ? null
      : LyricData(
          sgc: convertValueByType(jsonRes['sgc'], bool, stack: "LyricData-sgc"),
          sfy: convertValueByType(jsonRes['sfy'], bool, stack: "LyricData-sfy"),
          qfy: convertValueByType(jsonRes['qfy'], bool, stack: "LyricData-qfy"),
          transUser: TransUser.fromJson(jsonRes['transUser']),
          lyricUser: LyricUser.fromJson(jsonRes['lyricUser']),
          lrc: Lrc.fromJson(jsonRes['lrc']),
          klyric: Klyric.fromJson(jsonRes['klyric']),
          tlyric: Tlyric.fromJson(jsonRes['tlyric']),
          code:
              convertValueByType(jsonRes['code'], int, stack: "LyricData-code"),
        );

  Map<String, dynamic> toJson() => {
        'sgc': sgc,
        'sfy': sfy,
        'qfy': qfy,
        'transUser': transUser,
        'lyricUser': lyricUser,
        'lrc': lrc,
        'klyric': klyric,
        'tlyric': tlyric,
        'code': code,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class TransUser {
  int id;
  int status;
  int demand;
  int userid;
  String nickname;
  int uptime;

  TransUser({
    this.id,
    this.status,
    this.demand,
    this.userid,
    this.nickname,
    this.uptime,
  });

  factory TransUser.fromJson(jsonRes) => jsonRes == null
      ? null
      : TransUser(
          id: convertValueByType(jsonRes['id'], int, stack: "TransUser-id"),
          status: convertValueByType(jsonRes['status'], int,
              stack: "TransUser-status"),
          demand: convertValueByType(jsonRes['demand'], int,
              stack: "TransUser-demand"),
          userid: convertValueByType(jsonRes['userid'], int,
              stack: "TransUser-userid"),
          nickname: convertValueByType(jsonRes['nickname'], String,
              stack: "TransUser-nickname"),
          uptime: convertValueByType(jsonRes['uptime'], int,
              stack: "TransUser-uptime"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'demand': demand,
        'userid': userid,
        'nickname': nickname,
        'uptime': uptime,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class LyricUser {
  int id;
  int status;
  int demand;
  int userid;
  String nickname;
  int uptime;

  LyricUser({
    this.id,
    this.status,
    this.demand,
    this.userid,
    this.nickname,
    this.uptime,
  });

  factory LyricUser.fromJson(jsonRes) => jsonRes == null
      ? null
      : LyricUser(
          id: convertValueByType(jsonRes['id'], int, stack: "LyricUser-id"),
          status: convertValueByType(jsonRes['status'], int,
              stack: "LyricUser-status"),
          demand: convertValueByType(jsonRes['demand'], int,
              stack: "LyricUser-demand"),
          userid: convertValueByType(jsonRes['userid'], int,
              stack: "LyricUser-userid"),
          nickname: convertValueByType(jsonRes['nickname'], String,
              stack: "LyricUser-nickname"),
          uptime: convertValueByType(jsonRes['uptime'], int,
              stack: "LyricUser-uptime"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'demand': demand,
        'userid': userid,
        'nickname': nickname,
        'uptime': uptime,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Lrc {
  int version;
  String lyric;

  Lrc({
    this.version,
    this.lyric,
  });

  factory Lrc.fromJson(jsonRes) => jsonRes == null
      ? null
      : Lrc(
          version:
              convertValueByType(jsonRes['version'], int, stack: "Lrc-version"),
          lyric:
              convertValueByType(jsonRes['lyric'], String, stack: "Lrc-lyric"),
        );

  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Klyric {
  int version;
  Object lyric;

  Klyric({
    this.version,
    this.lyric,
  });

  factory Klyric.fromJson(jsonRes) => jsonRes == null
      ? null
      : Klyric(
          version: convertValueByType(jsonRes['version'], int,
              stack: "Klyric-version"),
          lyric:
              convertValueByType(jsonRes['lyric'], Null, stack: "Klyric-lyric"),
        );

  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Tlyric {
  int version;
  String lyric;

  Tlyric({
    this.version,
    this.lyric,
  });

  factory Tlyric.fromJson(jsonRes) => jsonRes == null
      ? null
      : Tlyric(
          version: convertValueByType(jsonRes['version'], int,
              stack: "Tlyric-version"),
          lyric: convertValueByType(jsonRes['lyric'], String,
              stack: "Tlyric-lyric"),
        );

  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

