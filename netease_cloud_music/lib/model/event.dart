import 'dart:convert' show json;
import 'dart:convert' as prefix0;
import 'package:flutter/foundation.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';


class EventRepository extends LoadingMoreBase<Event> {
  int pageindex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  EventData _eventData;
  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    pageindex = 1;
    //force to refresh list when you don't want clear list before request
    //for the case, if your list already has 20 items.
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    Map<String, dynamic> params;
    bool isSuccess = false;
    try {
      if(pageindex == 1){
        this.clear();
      }
      if (this.length != 0) {
        params =  {'lasttime': _eventData.lasttime};
      }
      var r = await NetUtils.getEventData(params: params);
      _eventData = r;
      this.addAll(r.event);

      _hasMore = r.event.length != 0;
      pageindex++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      print(exception);
      print(stack);
    }
    return isSuccess;
  }
}




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

class EventData {
  int code;
  bool more;
  List<Event> event;
  int lasttime;

  EventData({
    this.code,
    this.more,
    this.event,
    this.lasttime,
  });

  factory EventData.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Event> event = jsonRes['event'] is List ? [] : null;
    if (event != null) {
      for (var item in jsonRes['event']) {
        if (item != null) {
          event.add(Event.fromJson(item));
        }
      }
    }
    return EventData(
      code: convertValueByType(jsonRes['code'], int, stack: "EventData-code"),
      more: convertValueByType(jsonRes['more'], bool, stack: "EventData-more"),
      event: event,
      lasttime: convertValueByType(jsonRes['lasttime'], int,
          stack: "EventData-lasttime"),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'more': more,
        'event': event,
        'lasttime': lasttime,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Event {
  Object actName;
  Object pendantData;
  int forwardCount;
  Object lotteryEventData;
  RcmdInfo rcmdInfo;
  int actId;
  String json;
  List<Pics> pics;
  int showTime;
  int tmplId;
  User user;
  String uuid;
  int eventTime;
  int expireTime;
  int id;
  int type;
  bool topEvent;
  int insiteForwardCount;
  Info info;

  Event({
    this.actName,
    this.pendantData,
    this.forwardCount,
    this.lotteryEventData,
    this.rcmdInfo,
    this.actId,
    this.json,
    this.pics,
    this.showTime,
    this.tmplId,
    this.user,
    this.uuid,
    this.eventTime,
    this.expireTime,
    this.id,
    this.type,
    this.topEvent,
    this.insiteForwardCount,
    this.info,
  });

  factory Event.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Pics> pics = jsonRes['pics'] is List ? [] : null;
    if (pics != null) {
      for (var item in jsonRes['pics']) {
        if (item != null) {
          pics.add(Pics.fromJson(item));
        }
      }
    }
    return Event(
      actName:
          convertValueByType(jsonRes['actName'], Null, stack: "Event-actName"),
      pendantData: convertValueByType(jsonRes['pendantData'], Null,
          stack: "Event-pendantData"),
      forwardCount: convertValueByType(jsonRes['forwardCount'], int,
          stack: "Event-forwardCount"),
      lotteryEventData: convertValueByType(jsonRes['lotteryEventData'], Null,
          stack: "Event-lotteryEventData"),
      rcmdInfo: RcmdInfo.fromJson(jsonRes['rcmdInfo']),
      actId: convertValueByType(jsonRes['actId'], int, stack: "Event-actId"),
      json: convertValueByType(jsonRes['json'], String, stack: "Event-json"),
      pics: pics,
      showTime:
          convertValueByType(jsonRes['showTime'], int, stack: "Event-showTime"),
      tmplId: convertValueByType(jsonRes['tmplId'], int, stack: "Event-tmplId"),
      user: User.fromJson(jsonRes['user']),
      uuid: convertValueByType(jsonRes['uuid'], String, stack: "Event-uuid"),
      eventTime: convertValueByType(jsonRes['eventTime'], int,
          stack: "Event-eventTime"),
      expireTime: convertValueByType(jsonRes['expireTime'], int,
          stack: "Event-expireTime"),
      id: convertValueByType(jsonRes['id'], int, stack: "Event-id"),
      type: convertValueByType(jsonRes['type'], int, stack: "Event-type"),
      topEvent: convertValueByType(jsonRes['topEvent'], bool,
          stack: "Event-topEvent"),
      insiteForwardCount: convertValueByType(jsonRes['insiteForwardCount'], int,
          stack: "Event-insiteForwardCount"),
      info: Info.fromJson(jsonRes['info']),
    );
  }

  Map<String, dynamic> toJson() => {
        'actName': actName,
        'pendantData': pendantData,
        'forwardCount': forwardCount,
        'lotteryEventData': lotteryEventData,
        'rcmdInfo': rcmdInfo,
        'actId': actId,
        'json': json,
        'pics': pics,
        'showTime': showTime,
        'tmplId': tmplId,
        'user': user,
        'uuid': uuid,
        'eventTime': eventTime,
        'expireTime': expireTime,
        'id': id,
        'type': type,
        'topEvent': topEvent,
        'insiteForwardCount': insiteForwardCount,
        'info': info,
      };

  @override
  String toString() {
    return prefix0.json.encode(this);
  }
}

class RcmdInfo {
  String reason;
  String alg;
  int type;
  String scene;
  String userReason;

  RcmdInfo({
    this.reason,
    this.alg,
    this.type,
    this.scene,
    this.userReason,
  });

  factory RcmdInfo.fromJson(jsonRes) => jsonRes == null
      ? null
      : RcmdInfo(
          reason: convertValueByType(jsonRes['reason'], String,
              stack: "RcmdInfo-reason"),
          alg:
              convertValueByType(jsonRes['alg'], String, stack: "RcmdInfo-alg"),
          type:
              convertValueByType(jsonRes['type'], int, stack: "RcmdInfo-type"),
          scene: convertValueByType(jsonRes['scene'], String,
              stack: "RcmdInfo-scene"),
          userReason: convertValueByType(jsonRes['userReason'], String,
              stack: "RcmdInfo-userReason"),
        );

  Map<String, dynamic> toJson() => {
        'reason': reason,
        'alg': alg,
        'type': type,
        'scene': scene,
        'userReason': userReason,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Pics {
  String originUrl;
  String squareUrl;
  String rectangleUrl;
  String pcSquareUrl;
  String pcRectangleUrl;
  String format;
  int width;
  int height;

  Pics({
    this.originUrl,
    this.squareUrl,
    this.rectangleUrl,
    this.pcSquareUrl,
    this.pcRectangleUrl,
    this.format,
    this.width,
    this.height,
  });

  factory Pics.fromJson(jsonRes) => jsonRes == null
      ? null
      : Pics(
          originUrl: convertValueByType(jsonRes['originUrl'], String,
              stack: "Pics-originUrl"),
          squareUrl: convertValueByType(jsonRes['squareUrl'], String,
              stack: "Pics-squareUrl"),
          rectangleUrl: convertValueByType(jsonRes['rectangleUrl'], String,
              stack: "Pics-rectangleUrl"),
          pcSquareUrl: convertValueByType(jsonRes['pcSquareUrl'], String,
              stack: "Pics-pcSquareUrl"),
          pcRectangleUrl: convertValueByType(jsonRes['pcRectangleUrl'], String,
              stack: "Pics-pcRectangleUrl"),
          format: convertValueByType(jsonRes['format'], String,
              stack: "Pics-format"),
          width: convertValueByType(jsonRes['width'], int, stack: "Pics-width"),
          height:
              convertValueByType(jsonRes['height'], int, stack: "Pics-height"),
        );

  Map<String, dynamic> toJson() => {
        'originUrl': originUrl,
        'squareUrl': squareUrl,
        'rectangleUrl': rectangleUrl,
        'pcSquareUrl': pcSquareUrl,
        'pcRectangleUrl': pcRectangleUrl,
        'format': format,
        'width': width,
        'height': height,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class User {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  Object expertTags;
  Object experts;
  int djStatus;
  int vipType;
  Object remarkName;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  bool urlAnalyze;
  VipRights vipRights;
  String avatarImgId_str;
  int followeds;

  User({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.expertTags,
    this.experts,
    this.djStatus,
    this.vipType,
    this.remarkName,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.urlAnalyze,
    this.vipRights,
    this.avatarImgId_str,
    this.followeds,
  });

  factory User.fromJson(jsonRes) => jsonRes == null
      ? null
      : User(
          defaultAvatar: convertValueByType(jsonRes['defaultAvatar'], bool,
              stack: "User-defaultAvatar"),
          province: convertValueByType(jsonRes['province'], int,
              stack: "User-province"),
          authStatus: convertValueByType(jsonRes['authStatus'], int,
              stack: "User-authStatus"),
          followed: convertValueByType(jsonRes['followed'], bool,
              stack: "User-followed"),
          avatarUrl: convertValueByType(jsonRes['avatarUrl'], String,
              stack: "User-avatarUrl"),
          accountStatus: convertValueByType(jsonRes['accountStatus'], int,
              stack: "User-accountStatus"),
          gender:
              convertValueByType(jsonRes['gender'], int, stack: "User-gender"),
          city: convertValueByType(jsonRes['city'], int, stack: "User-city"),
          birthday: convertValueByType(jsonRes['birthday'], int,
              stack: "User-birthday"),
          userId:
              convertValueByType(jsonRes['userId'], int, stack: "User-userId"),
          userType: convertValueByType(jsonRes['userType'], int,
              stack: "User-userType"),
          nickname: convertValueByType(jsonRes['nickname'], String,
              stack: "User-nickname"),
          signature: convertValueByType(jsonRes['signature'], String,
              stack: "User-signature"),
          description: convertValueByType(jsonRes['description'], String,
              stack: "User-description"),
          detailDescription: convertValueByType(
              jsonRes['detailDescription'], String,
              stack: "User-detailDescription"),
          avatarImgId: convertValueByType(jsonRes['avatarImgId'], int,
              stack: "User-avatarImgId"),
          backgroundImgId: convertValueByType(jsonRes['backgroundImgId'], int,
              stack: "User-backgroundImgId"),
          backgroundUrl: convertValueByType(jsonRes['backgroundUrl'], String,
              stack: "User-backgroundUrl"),
          authority: convertValueByType(jsonRes['authority'], int,
              stack: "User-authority"),
          mutual:
              convertValueByType(jsonRes['mutual'], bool, stack: "User-mutual"),
          expertTags: convertValueByType(jsonRes['expertTags'], Null,
              stack: "User-expertTags"),
          experts: convertValueByType(jsonRes['experts'], Null,
              stack: "User-experts"),
          djStatus: convertValueByType(jsonRes['djStatus'], int,
              stack: "User-djStatus"),
          vipType: convertValueByType(jsonRes['vipType'], int,
              stack: "User-vipType"),
          remarkName: convertValueByType(jsonRes['remarkName'], Null,
              stack: "User-remarkName"),
          avatarImgIdStr: convertValueByType(jsonRes['avatarImgIdStr'], String,
              stack: "User-avatarImgIdStr"),
          backgroundImgIdStr: convertValueByType(
              jsonRes['backgroundImgIdStr'], String,
              stack: "User-backgroundImgIdStr"),
          urlAnalyze: convertValueByType(jsonRes['urlAnalyze'], bool,
              stack: "User-urlAnalyze"),
          vipRights: VipRights.fromJson(jsonRes['vipRights']),
          avatarImgId_str: convertValueByType(
              jsonRes['avatarImgId_str'], String,
              stack: "User-avatarImgId_str"),
          followeds: convertValueByType(jsonRes['followeds'], int,
              stack: "User-followeds"),
        );

  Map<String, dynamic> toJson() => {
        'defaultAvatar': defaultAvatar,
        'province': province,
        'authStatus': authStatus,
        'followed': followed,
        'avatarUrl': avatarUrl,
        'accountStatus': accountStatus,
        'gender': gender,
        'city': city,
        'birthday': birthday,
        'userId': userId,
        'userType': userType,
        'nickname': nickname,
        'signature': signature,
        'description': description,
        'detailDescription': detailDescription,
        'avatarImgId': avatarImgId,
        'backgroundImgId': backgroundImgId,
        'backgroundUrl': backgroundUrl,
        'authority': authority,
        'mutual': mutual,
        'expertTags': expertTags,
        'experts': experts,
        'djStatus': djStatus,
        'vipType': vipType,
        'remarkName': remarkName,
        'avatarImgIdStr': avatarImgIdStr,
        'backgroundImgIdStr': backgroundImgIdStr,
        'urlAnalyze': urlAnalyze,
        'vipRights': vipRights,
        'avatarImgId_str': avatarImgId_str,
        'followeds': followeds,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class VipRights {
  Associator associator;
  Object musicPackage;
  int redVipAnnualCount;

  VipRights({
    this.associator,
    this.musicPackage,
    this.redVipAnnualCount,
  });

  factory VipRights.fromJson(jsonRes) => jsonRes == null
      ? null
      : VipRights(
          associator: Associator.fromJson(jsonRes['associator']),
          musicPackage: convertValueByType(jsonRes['musicPackage'], Null,
              stack: "VipRights-musicPackage"),
          redVipAnnualCount: convertValueByType(
              jsonRes['redVipAnnualCount'], int,
              stack: "VipRights-redVipAnnualCount"),
        );

  Map<String, dynamic> toJson() => {
        'associator': associator,
        'musicPackage': musicPackage,
        'redVipAnnualCount': redVipAnnualCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Associator {
  int vipCode;
  bool rights;

  Associator({
    this.vipCode,
    this.rights,
  });

  factory Associator.fromJson(jsonRes) => jsonRes == null
      ? null
      : Associator(
          vipCode: convertValueByType(jsonRes['vipCode'], int,
              stack: "Associator-vipCode"),
          rights: convertValueByType(jsonRes['rights'], bool,
              stack: "Associator-rights"),
        );

  Map<String, dynamic> toJson() => {
        'vipCode': vipCode,
        'rights': rights,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Info {
  CommentThread commentThread;
  Object latestLikedUsers;
  bool liked;
  Object comments;
  int resourceType;
  int resourceId;
  int shareCount;
  int commentCount;
  int likedCount;
  String threadId;

  Info({
    this.commentThread,
    this.latestLikedUsers,
    this.liked,
    this.comments,
    this.resourceType,
    this.resourceId,
    this.shareCount,
    this.commentCount,
    this.likedCount,
    this.threadId,
  });

  factory Info.fromJson(jsonRes) => jsonRes == null
      ? null
      : Info(
          commentThread: CommentThread.fromJson(jsonRes['commentThread']),
          latestLikedUsers: convertValueByType(
              jsonRes['latestLikedUsers'], Null,
              stack: "Info-latestLikedUsers"),
          liked:
              convertValueByType(jsonRes['liked'], bool, stack: "Info-liked"),
          comments: convertValueByType(jsonRes['comments'], Null,
              stack: "Info-comments"),
          resourceType: convertValueByType(jsonRes['resourceType'], int,
              stack: "Info-resourceType"),
          resourceId: convertValueByType(jsonRes['resourceId'], int,
              stack: "Info-resourceId"),
          shareCount: convertValueByType(jsonRes['shareCount'], int,
              stack: "Info-shareCount"),
          commentCount: convertValueByType(jsonRes['commentCount'], int,
              stack: "Info-commentCount"),
          likedCount: convertValueByType(jsonRes['likedCount'], int,
              stack: "Info-likedCount"),
          threadId: convertValueByType(jsonRes['threadId'], String,
              stack: "Info-threadId"),
        );

  Map<String, dynamic> toJson() => {
        'commentThread': commentThread,
        'latestLikedUsers': latestLikedUsers,
        'liked': liked,
        'comments': comments,
        'resourceType': resourceType,
        'resourceId': resourceId,
        'shareCount': shareCount,
        'commentCount': commentCount,
        'likedCount': likedCount,
        'threadId': threadId,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class CommentThread {
  String id;
  ResourceInfo resourceInfo;
  int resourceType;
  int commentCount;
  int likedCount;
  int shareCount;
  int hotCount;
  List<LatestLikedUsers> latestLikedUsers;
  int resourceId;
  int resourceOwnerId;
  String resourceTitle;

  CommentThread({
    this.id,
    this.resourceInfo,
    this.resourceType,
    this.commentCount,
    this.likedCount,
    this.shareCount,
    this.hotCount,
    this.latestLikedUsers,
    this.resourceId,
    this.resourceOwnerId,
    this.resourceTitle,
  });

  factory CommentThread.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<LatestLikedUsers> latestLikedUsers =
        jsonRes['latestLikedUsers'] is List ? [] : null;
    if (latestLikedUsers != null) {
      for (var item in jsonRes['latestLikedUsers']) {
        if (item != null) {
          latestLikedUsers.add(LatestLikedUsers.fromJson(item));
        }
      }
    }
    return CommentThread(
      id: convertValueByType(jsonRes['id'], String, stack: "CommentThread-id"),
      resourceInfo: ResourceInfo.fromJson(jsonRes['resourceInfo']),
      resourceType: convertValueByType(jsonRes['resourceType'], int,
          stack: "CommentThread-resourceType"),
      commentCount: convertValueByType(jsonRes['commentCount'], int,
          stack: "CommentThread-commentCount"),
      likedCount: convertValueByType(jsonRes['likedCount'], int,
          stack: "CommentThread-likedCount"),
      shareCount: convertValueByType(jsonRes['shareCount'], int,
          stack: "CommentThread-shareCount"),
      hotCount: convertValueByType(jsonRes['hotCount'], int,
          stack: "CommentThread-hotCount"),
      latestLikedUsers: latestLikedUsers,
      resourceId: convertValueByType(jsonRes['resourceId'], int,
          stack: "CommentThread-resourceId"),
      resourceOwnerId: convertValueByType(jsonRes['resourceOwnerId'], int,
          stack: "CommentThread-resourceOwnerId"),
      resourceTitle: convertValueByType(jsonRes['resourceTitle'], String,
          stack: "CommentThread-resourceTitle"),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'resourceInfo': resourceInfo,
        'resourceType': resourceType,
        'commentCount': commentCount,
        'likedCount': likedCount,
        'shareCount': shareCount,
        'hotCount': hotCount,
        'latestLikedUsers': latestLikedUsers,
        'resourceId': resourceId,
        'resourceOwnerId': resourceOwnerId,
        'resourceTitle': resourceTitle,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class ResourceInfo {
  int id;
  int userId;
  String name;
  Object imgUrl;
  Object creator;
  int eventType;

  ResourceInfo({
    this.id,
    this.userId,
    this.name,
    this.imgUrl,
    this.creator,
    this.eventType,
  });

  factory ResourceInfo.fromJson(jsonRes) => jsonRes == null
      ? null
      : ResourceInfo(
          id: convertValueByType(jsonRes['id'], int, stack: "ResourceInfo-id"),
          userId: convertValueByType(jsonRes['userId'], int,
              stack: "ResourceInfo-userId"),
          name: convertValueByType(jsonRes['name'], String,
              stack: "ResourceInfo-name"),
          imgUrl: convertValueByType(jsonRes['imgUrl'], Null,
              stack: "ResourceInfo-imgUrl"),
          creator: convertValueByType(jsonRes['creator'], Null,
              stack: "ResourceInfo-creator"),
          eventType: convertValueByType(jsonRes['eventType'], int,
              stack: "ResourceInfo-eventType"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'imgUrl': imgUrl,
        'creator': creator,
        'eventType': eventType,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class LatestLikedUsers {
  int s;
  int t;

  LatestLikedUsers({
    this.s,
    this.t,
  });

  factory LatestLikedUsers.fromJson(jsonRes) => jsonRes == null
      ? null
      : LatestLikedUsers(
          s: convertValueByType(jsonRes['s'], int, stack: "LatestLikedUsers-s"),
          t: convertValueByType(jsonRes['t'], int, stack: "LatestLikedUsers-t"),
        );

  Map<String, dynamic> toJson() => {
        's': s,
        't': t,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
