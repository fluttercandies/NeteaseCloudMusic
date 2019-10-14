import 'dart:convert' show json;
import 'package:flutter/foundation.dart';

dynamic convertValueByType(value, Type type, {String stack: ""}) {
  if (value == null) {
    debugPrint("$stack : value is null");
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

class TopListData {
  int code;
  List<TopList> list;

  TopListData({
    this.code,
    this.list,
  });

  factory TopListData.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<TopList> list = jsonRes['list'] is List ? [] : null;
    if (list != null) {
      for (var item in jsonRes['list']) {
        if (item != null) {
          tryCatch(() {
            list.add(TopList.fromJson(item));
          });
        }
      }
    }
    return TopListData(
      code: convertValueByType(jsonRes['code'], int, stack: "TopListData-code"),
      list: list,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'list': list,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class TopList {
  List<Tracks> tracks;
  String updateFrequency;
  int backgroundCoverId;
  int titleImage;
  bool opRecommend;
  int subscribedCount;
  int cloudTrackCount;
  int createTime;
  bool highQuality;
  int userId;
  int updateTime;
  int coverImgId;
  bool newImported;
  bool anonimous;
  int specialType;
  String coverImgUrl;
  int trackCount;
  int privacy;
  int trackUpdateTime;
  int totalDuration;
  String commentThreadId;
  int trackNumberUpdateTime;
  int playCount;
  int adType;
  String description;
  bool ordered;
  int status;
  String name;
  int id;
  String coverImgId_str;
  String ToplistType;

  TopList({
    this.tracks,
    this.updateFrequency,
    this.backgroundCoverId,
    this.titleImage,
    this.opRecommend,
    this.subscribedCount,
    this.cloudTrackCount,
    this.createTime,
    this.highQuality,
    this.userId,
    this.updateTime,
    this.coverImgId,
    this.newImported,
    this.anonimous,
    this.specialType,
    this.coverImgUrl,
    this.trackCount,
    this.privacy,
    this.trackUpdateTime,
    this.totalDuration,
    this.commentThreadId,
    this.trackNumberUpdateTime,
    this.playCount,
    this.adType,
    this.description,
    this.ordered,
    this.status,
    this.name,
    this.id,
    this.coverImgId_str,
    this.ToplistType,
  });

  factory TopList.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Tracks> tracks = jsonRes['tracks'] is List ? [] : null;
    if (tracks != null) {
      for (var item in jsonRes['tracks']) {
        if (item != null) {
          tryCatch(() {
            tracks.add(Tracks.fromJson(item));
          });
        }
      }
    }
    return TopList(
      tracks: tracks,
      updateFrequency: convertValueByType(jsonRes['updateFrequency'], String,
          stack: "TopList-updateFrequency"),
      backgroundCoverId: convertValueByType(jsonRes['backgroundCoverId'], int,
          stack: "TopList-backgroundCoverId"),
      titleImage: convertValueByType(jsonRes['titleImage'], int,
          stack: "TopList-titleImage"),
      opRecommend: convertValueByType(jsonRes['opRecommend'], bool,
          stack: "TopList-opRecommend"),
      subscribedCount: convertValueByType(jsonRes['subscribedCount'], int,
          stack: "TopList-subscribedCount"),
      cloudTrackCount: convertValueByType(jsonRes['cloudTrackCount'], int,
          stack: "TopList-cloudTrackCount"),
      createTime: convertValueByType(jsonRes['createTime'], int,
          stack: "TopList-createTime"),
      highQuality: convertValueByType(jsonRes['highQuality'], bool,
          stack: "TopList-highQuality"),
      userId:
          convertValueByType(jsonRes['userId'], int, stack: "TopList-userId"),
      updateTime: convertValueByType(jsonRes['updateTime'], int,
          stack: "TopList-updateTime"),
      coverImgId: convertValueByType(jsonRes['coverImgId'], int,
          stack: "TopList-coverImgId"),
      newImported: convertValueByType(jsonRes['newImported'], bool,
          stack: "TopList-newImported"),
      anonimous: convertValueByType(jsonRes['anonimous'], bool,
          stack: "TopList-anonimous"),
      specialType: convertValueByType(jsonRes['specialType'], int,
          stack: "TopList-specialType"),
      coverImgUrl: convertValueByType(jsonRes['coverImgUrl'], String,
          stack: "TopList-coverImgUrl"),
      trackCount: convertValueByType(jsonRes['trackCount'], int,
          stack: "TopList-trackCount"),
      privacy:
          convertValueByType(jsonRes['privacy'], int, stack: "TopList-privacy"),
      trackUpdateTime: convertValueByType(jsonRes['trackUpdateTime'], int,
          stack: "TopList-trackUpdateTime"),
      totalDuration: convertValueByType(jsonRes['totalDuration'], int,
          stack: "TopList-totalDuration"),
      commentThreadId: convertValueByType(jsonRes['commentThreadId'], String,
          stack: "TopList-commentThreadId"),
      trackNumberUpdateTime: convertValueByType(
          jsonRes['trackNumberUpdateTime'], int,
          stack: "TopList-trackNumberUpdateTime"),
      playCount: convertValueByType(jsonRes['playCount'], int,
          stack: "TopList-playCount"),
      adType:
          convertValueByType(jsonRes['adType'], int, stack: "TopList-adType"),
      description: convertValueByType(jsonRes['description'], String,
          stack: "TopList-description"),
      ordered: convertValueByType(jsonRes['ordered'], bool,
          stack: "TopList-ordered"),
      status:
          convertValueByType(jsonRes['status'], int, stack: "TopList-status"),
      name: convertValueByType(jsonRes['name'], String, stack: "TopList-name"),
      id: convertValueByType(jsonRes['id'], int, stack: "TopList-id"),
      coverImgId_str: convertValueByType(jsonRes['coverImgId_str'], String,
          stack: "TopList-coverImgId_str"),
      ToplistType: convertValueByType(jsonRes['ToplistType'], String,
          stack: "TopList-ToplistType"),
    );
  }

  Map<String, dynamic> toJson() => {
        'tracks': tracks,
        'updateFrequency': updateFrequency,
        'backgroundCoverId': backgroundCoverId,
        'titleImage': titleImage,
        'opRecommend': opRecommend,
        'subscribedCount': subscribedCount,
        'cloudTrackCount': cloudTrackCount,
        'createTime': createTime,
        'highQuality': highQuality,
        'userId': userId,
        'updateTime': updateTime,
        'coverImgId': coverImgId,
        'newImported': newImported,
        'anonimous': anonimous,
        'specialType': specialType,
        'coverImgUrl': coverImgUrl,
        'trackCount': trackCount,
        'privacy': privacy,
        'trackUpdateTime': trackUpdateTime,
        'totalDuration': totalDuration,
        'commentThreadId': commentThreadId,
        'trackNumberUpdateTime': trackNumberUpdateTime,
        'playCount': playCount,
        'adType': adType,
        'description': description,
        'ordered': ordered,
        'status': status,
        'name': name,
        'id': id,
        'coverImgId_str': coverImgId_str,
        'ToplistType': ToplistType,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Tracks {
  String first;
  String second;

  Tracks({
    this.first,
    this.second,
  });

  factory Tracks.fromJson(jsonRes) => jsonRes == null
      ? null
      : Tracks(
          first: convertValueByType(jsonRes['first'], String,
              stack: "Tracks-first"),
          second: convertValueByType(jsonRes['second'], String,
              stack: "Tracks-second"),
        );

  Map<String, dynamic> toJson() => {
        'first': first,
        'second': second,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
