import 'dart:convert' show json;
import 'package:flutter/foundation.dart';

dynamic convertValueByType(value, Type type, {String stack: ""}) {
  if (value == null) {
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

class SongCommentData {
  bool isMusician;
  int userId;
  List<Object> topComments;
  int code;
  List<Comments> comments;
  List<Comments> hotComments;
  Comments comment;
  int total;
  bool more;

  SongCommentData({
    this.isMusician,
    this.userId,
    this.topComments,
    this.code,
    this.comments,
    this.total,
    this.more,
    this.hotComments,
    this.comment,
  });

  factory SongCommentData.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> topComments = jsonRes['topComments'] is List ? [] : null;
    if (topComments != null) {
      for (var item in jsonRes['topComments']) {
        if (item != null) {
          tryCatch(() {
            topComments.add(item);
          });
        }
      }
    }

    List<Comments> comments = jsonRes['comments'] is List ? [] : null;
    if (comments != null) {
      for (var item in jsonRes['comments']) {
        if (item != null) {
          tryCatch(() {
            comments.add(Comments.fromJson(item));
          });
        }
      }
    }
    List<Comments> hotComments = jsonRes['hotComments'] is List ? [] : null;
    if (hotComments != null) {
      for (var item in jsonRes['hotComments']) {
        if (item != null) {
          tryCatch(() {
            hotComments.add(Comments.fromJson(item));
          });
        }
      }
    }
    return SongCommentData(
      isMusician: convertValueByType(jsonRes['isMusician'], bool,
          stack: "SongCommentData-isMusician"),
      userId: convertValueByType(jsonRes['userId'], int,
          stack: "SongCommentData-userId"),
      topComments: topComments,
      hotComments: hotComments,
      code: convertValueByType(jsonRes['code'], int,
          stack: "SongCommentData-code"),
      comments: comments,
      comment: Comments.fromJson(jsonRes['comment']),
      total: convertValueByType(jsonRes['total'], int,
          stack: "SongCommentData-total"),
      more: convertValueByType(jsonRes['more'], bool,
          stack: "SongCommentData-more"),
    );
  }

  Map<String, dynamic> toJson() => {
        'isMusician': isMusician,
        'userId': userId,
        'topComments': topComments,
        'hotComments': hotComments,
        'code': code,
        'comments': comments,
        'total': total,
        'more': more,
        'comment': comment,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Comments {
  User user;
  List<BeReplied> beReplied;
  Object pendantData;
  Object showFloorComment;
  int status;
  int commentId;
  String content;
  int time;
  int likedCount;
  Object expressionUrl;
  int commentLocationType;
  int parentCommentId;
  Object decoration;
  Object repliedMark;
  bool liked;
  bool isTitle;
  String title;


  Comments({
    this.user,
    this.beReplied,
    this.pendantData,
    this.showFloorComment,
    this.status,
    this.commentId,
    this.content,
    this.time,
    this.likedCount,
    this.expressionUrl,
    this.commentLocationType,
    this.parentCommentId,
    this.decoration,
    this.repliedMark,
    this.liked,
    this.isTitle = false,
    this.title,
  });

  factory Comments.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<BeReplied> beReplied = jsonRes['beReplied'] is List ? [] : null;
    if (beReplied != null) {
      for (var item in jsonRes['beReplied']) {
        if (item != null) {
          tryCatch(() {
            beReplied.add(BeReplied.fromJson(item));
          });
        }
      }
    }
    return Comments(
      user: User.fromJson(jsonRes['user']),
      beReplied: beReplied,
      pendantData: convertValueByType(jsonRes['pendantData'], Null,
          stack: "Comments-pendantData"),
      showFloorComment: convertValueByType(jsonRes['showFloorComment'], Null,
          stack: "Comments-showFloorComment"),
      status:
          convertValueByType(jsonRes['status'], int, stack: "Comments-status"),
      commentId: convertValueByType(jsonRes['commentId'], int,
          stack: "Comments-commentId"),
      content: convertValueByType(jsonRes['content'], String,
          stack: "Comments-content"),
      time: convertValueByType(jsonRes['time'], int, stack: "Comments-time"),
      likedCount: convertValueByType(jsonRes['likedCount'], int,
          stack: "Comments-likedCount"),
      expressionUrl: convertValueByType(jsonRes['expressionUrl'], Null,
          stack: "Comments-expressionUrl"),
      commentLocationType: convertValueByType(
          jsonRes['commentLocationType'], int,
          stack: "Comments-commentLocationType"),
      parentCommentId: convertValueByType(jsonRes['parentCommentId'], int,
          stack: "Comments-parentCommentId"),
      decoration: convertValueByType(jsonRes['decoration'], Object,
          stack: "Comments-decoration"),
      repliedMark: convertValueByType(jsonRes['repliedMark'], Null,
          stack: "Comments-repliedMark"),
      liked:
          convertValueByType(jsonRes['liked'], bool, stack: "Comments-liked"),
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user,
        'beReplied': beReplied,
        'pendantData': pendantData,
        'showFloorComment': showFloorComment,
        'status': status,
        'commentId': commentId,
        'content': content,
        'time': time,
        'likedCount': likedCount,
        'expressionUrl': expressionUrl,
        'commentLocationType': commentLocationType,
        'parentCommentId': parentCommentId,
        'decoration': decoration,
        'repliedMark': repliedMark,
        'liked': liked,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class User {
  Object locationInfo;
  Object liveInfo;
  int vipType;
  Object vipRights;
  int userType;
  Object remarkName;
  String nickname;
  Object expertTags;
  int userId;
  String avatarUrl;
  Object experts;
  int authStatus;

  User({
    this.locationInfo,
    this.liveInfo,
    this.vipType,
    this.vipRights,
    this.userType,
    this.remarkName,
    this.nickname,
    this.expertTags,
    this.userId,
    this.avatarUrl,
    this.experts,
    this.authStatus,
  });

  factory User.fromJson(jsonRes) => jsonRes == null
      ? null
      : User(
          locationInfo: convertValueByType(jsonRes['locationInfo'], Null,
              stack: "User-locationInfo"),
          liveInfo: convertValueByType(jsonRes['liveInfo'], Null,
              stack: "User-liveInfo"),
          vipType: convertValueByType(jsonRes['vipType'], int,
              stack: "User-vipType"),
          vipRights: convertValueByType(jsonRes['vipRights'], Null,
              stack: "User-vipRights"),
          userType: convertValueByType(jsonRes['userType'], int,
              stack: "User-userType"),
          remarkName: convertValueByType(jsonRes['remarkName'], Null,
              stack: "User-remarkName"),
          nickname: convertValueByType(jsonRes['nickname'], String,
              stack: "User-nickname"),
          expertTags: convertValueByType(jsonRes['expertTags'], Null,
              stack: "User-expertTags"),
          userId:
              convertValueByType(jsonRes['userId'], int, stack: "User-userId"),
          avatarUrl: convertValueByType(jsonRes['avatarUrl'], String,
              stack: "User-avatarUrl"),
          experts: convertValueByType(jsonRes['experts'], Null,
              stack: "User-experts"),
          authStatus: convertValueByType(jsonRes['authStatus'], int,
              stack: "User-authStatus"),
        );

  Map<String, dynamic> toJson() => {
        'locationInfo': locationInfo,
        'liveInfo': liveInfo,
        'vipType': vipType,
        'vipRights': vipRights,
        'userType': userType,
        'remarkName': remarkName,
        'nickname': nickname,
        'expertTags': expertTags,
        'userId': userId,
        'avatarUrl': avatarUrl,
        'experts': experts,
        'authStatus': authStatus,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class BeReplied {
  User user;
  int beRepliedCommentId;
  String content;
  int status;
  Object expressionUrl;

  BeReplied({
    this.user,
    this.beRepliedCommentId,
    this.content,
    this.status,
    this.expressionUrl,
  });

  factory BeReplied.fromJson(jsonRes) => jsonRes == null
      ? null
      : BeReplied(
          user: User.fromJson(jsonRes['user']),
          beRepliedCommentId: convertValueByType(
              jsonRes['beRepliedCommentId'], int,
              stack: "BeReplied-beRepliedCommentId"),
          content: convertValueByType(jsonRes['content'], String,
              stack: "BeReplied-content"),
          status: convertValueByType(jsonRes['status'], int,
              stack: "BeReplied-status"),
          expressionUrl: convertValueByType(jsonRes['expressionUrl'], Null,
              stack: "BeReplied-expressionUrl"),
        );

  Map<String, dynamic> toJson() => {
        'user': user,
        'beRepliedCommentId': beRepliedCommentId,
        'content': content,
        'status': status,
        'expressionUrl': expressionUrl,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
