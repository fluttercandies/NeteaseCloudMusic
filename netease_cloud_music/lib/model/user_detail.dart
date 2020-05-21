import 'dart:convert' show json;

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

class UserDetailData {
  int level;
  int listenSongs;
  UserPoint userPoint;
  bool mobileSign;
  bool pcSign;
  Profile profile;
  bool peopleCanSeeMyPlayRecord;
  List<Bindings> bindings;
  bool adValid;
  int code;
  int createTime;
  int createDays;

  UserDetailData({
    this.level,
    this.listenSongs,
    this.userPoint,
    this.mobileSign,
    this.pcSign,
    this.profile,
    this.peopleCanSeeMyPlayRecord,
    this.bindings,
    this.adValid,
    this.code,
    this.createTime,
    this.createDays,
  });

  factory UserDetailData.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Bindings> bindings = jsonRes['bindings'] is List ? [] : null;
    if (bindings != null) {
      for (var item in jsonRes['bindings']) {
        if (item != null) {
          bindings.add(Bindings.fromJson(item));
        }
      }
    }
    return UserDetailData(
      level: convertValueByType(jsonRes['level'], int,
          stack: "UserDetailData-level"),
      listenSongs: convertValueByType(jsonRes['listenSongs'], int,
          stack: "UserDetailData-listenSongs"),
      userPoint: UserPoint.fromJson(jsonRes['userPoint']),
      mobileSign: convertValueByType(jsonRes['mobileSign'], bool,
          stack: "UserDetailData-mobileSign"),
      pcSign: convertValueByType(jsonRes['pcSign'], bool,
          stack: "UserDetailData-pcSign"),
      profile: Profile.fromJson(jsonRes['profile']),
      peopleCanSeeMyPlayRecord: convertValueByType(
          jsonRes['peopleCanSeeMyPlayRecord'], bool,
          stack: "UserDetailData-peopleCanSeeMyPlayRecord"),
      bindings: bindings,
      adValid: convertValueByType(jsonRes['adValid'], bool,
          stack: "UserDetailData-adValid"),
      code: convertValueByType(jsonRes['code'], int,
          stack: "UserDetailData-code"),
      createTime: convertValueByType(jsonRes['createTime'], int,
          stack: "UserDetailData-createTime"),
      createDays: convertValueByType(jsonRes['createDays'], int,
          stack: "UserDetailData-createDays"),
    );
  }

  Map<String, dynamic> toJson() => {
        'level': level,
        'listenSongs': listenSongs,
        'userPoint': userPoint,
        'mobileSign': mobileSign,
        'pcSign': pcSign,
        'profile': profile,
        'peopleCanSeeMyPlayRecord': peopleCanSeeMyPlayRecord,
        'bindings': bindings,
        'adValid': adValid,
        'code': code,
        'createTime': createTime,
        'createDays': createDays,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class UserPoint {
  int userId;
  int balance;
  int updateTime;
  int version;
  int status;
  int blockBalance;

  UserPoint({
    this.userId,
    this.balance,
    this.updateTime,
    this.version,
    this.status,
    this.blockBalance,
  });

  factory UserPoint.fromJson(jsonRes) => jsonRes == null
      ? null
      : UserPoint(
          userId: convertValueByType(jsonRes['userId'], int,
              stack: "UserPoint-userId"),
          balance: convertValueByType(jsonRes['balance'], int,
              stack: "UserPoint-balance"),
          updateTime: convertValueByType(jsonRes['updateTime'], int,
              stack: "UserPoint-updateTime"),
          version: convertValueByType(jsonRes['version'], int,
              stack: "UserPoint-version"),
          status: convertValueByType(jsonRes['status'], int,
              stack: "UserPoint-status"),
          blockBalance: convertValueByType(jsonRes['blockBalance'], int,
              stack: "UserPoint-blockBalance"),
        );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'balance': balance,
        'updateTime': updateTime,
        'version': version,
        'status': status,
        'blockBalance': blockBalance,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Profile {
  int vipType;
  int userType;
  int createTime;
  String nickname;
  bool mutual;
  bool followed;
  Object remarkName;
  int authStatus;
  String detailDescription;
  int djStatus;
  int accountStatus;
  int province;
  int city;
  bool defaultAvatar;
  int backgroundImgId;
  String backgroundUrl;
  int gender;
  int birthday;
  int avatarImgId;
  String avatarUrl;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String description;
  int userId;
  String signature;
  int authority;
  int followeds;
  int follows;
  bool blacklist;
  int eventCount;
  int allSubscribedCount;
  int playlistBeSubscribedCount;
  Object followTime;
  bool followMe;
  List<Object> artistIdentity;
  int cCount;
  int sDJPCount;
  int playlistCount;
  int sCount;
  int newFollows;

  Profile({
    this.vipType,
    this.userType,
    this.createTime,
    this.nickname,
    this.mutual,
    this.followed,
    this.remarkName,
    this.authStatus,
    this.detailDescription,
    this.djStatus,
    this.accountStatus,
    this.province,
    this.city,
    this.defaultAvatar,
    this.backgroundImgId,
    this.backgroundUrl,
    this.gender,
    this.birthday,
    this.avatarImgId,
    this.avatarUrl,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.description,
    this.userId,
    this.signature,
    this.authority,
    this.followeds,
    this.follows,
    this.blacklist,
    this.eventCount,
    this.allSubscribedCount,
    this.playlistBeSubscribedCount,
    this.followTime,
    this.followMe,
    this.artistIdentity,
    this.cCount,
    this.sDJPCount,
    this.playlistCount,
    this.sCount,
    this.newFollows,
  });

  factory Profile.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> artistIdentity = jsonRes['artistIdentity'] is List ? [] : null;
    if (artistIdentity != null) {
      for (var item in jsonRes['artistIdentity']) {
        if (item != null) {
          artistIdentity.add(item);
        }
      }
    }
    return Profile(
      vipType:
          convertValueByType(jsonRes['vipType'], int, stack: "Profile-vipType"),
      userType: convertValueByType(jsonRes['userType'], int,
          stack: "Profile-userType"),
      createTime: convertValueByType(jsonRes['createTime'], int,
          stack: "Profile-createTime"),
      nickname: convertValueByType(jsonRes['nickname'], String,
          stack: "Profile-nickname"),
      mutual:
          convertValueByType(jsonRes['mutual'], bool, stack: "Profile-mutual"),
      followed: convertValueByType(jsonRes['followed'], bool,
          stack: "Profile-followed"),
      remarkName: convertValueByType(jsonRes['remarkName'], Null,
          stack: "Profile-remarkName"),
      authStatus: convertValueByType(jsonRes['authStatus'], int,
          stack: "Profile-authStatus"),
      detailDescription: convertValueByType(
          jsonRes['detailDescription'], String,
          stack: "Profile-detailDescription"),
      djStatus: convertValueByType(jsonRes['djStatus'], int,
          stack: "Profile-djStatus"),
      accountStatus: convertValueByType(jsonRes['accountStatus'], int,
          stack: "Profile-accountStatus"),
      province: convertValueByType(jsonRes['province'], int,
          stack: "Profile-province"),
      city: convertValueByType(jsonRes['city'], int, stack: "Profile-city"),
      defaultAvatar: convertValueByType(jsonRes['defaultAvatar'], bool,
          stack: "Profile-defaultAvatar"),
      backgroundImgId: convertValueByType(jsonRes['backgroundImgId'], int,
          stack: "Profile-backgroundImgId"),
      backgroundUrl: convertValueByType(jsonRes['backgroundUrl'], String,
          stack: "Profile-backgroundUrl"),
      gender:
          convertValueByType(jsonRes['gender'], int, stack: "Profile-gender"),
      birthday: convertValueByType(jsonRes['birthday'], int,
          stack: "Profile-birthday"),
      avatarImgId: convertValueByType(jsonRes['avatarImgId'], int,
          stack: "Profile-avatarImgId"),
      avatarUrl: convertValueByType(jsonRes['avatarUrl'], String,
          stack: "Profile-avatarUrl"),
      avatarImgIdStr: convertValueByType(jsonRes['avatarImgIdStr'], String,
          stack: "Profile-avatarImgIdStr"),
      backgroundImgIdStr: convertValueByType(
          jsonRes['backgroundImgIdStr'], String,
          stack: "Profile-backgroundImgIdStr"),
      description: convertValueByType(jsonRes['description'], String,
          stack: "Profile-description"),
      userId:
          convertValueByType(jsonRes['userId'], int, stack: "Profile-userId"),
      signature: convertValueByType(jsonRes['signature'], String,
          stack: "Profile-signature"),
      authority: convertValueByType(jsonRes['authority'], int,
          stack: "Profile-authority"),
      followeds: convertValueByType(jsonRes['followeds'], int,
          stack: "Profile-followeds"),
      follows:
          convertValueByType(jsonRes['follows'], int, stack: "Profile-follows"),
      blacklist: convertValueByType(jsonRes['blacklist'], bool,
          stack: "Profile-blacklist"),
      eventCount: convertValueByType(jsonRes['eventCount'], int,
          stack: "Profile-eventCount"),
      allSubscribedCount: convertValueByType(jsonRes['allSubscribedCount'], int,
          stack: "Profile-allSubscribedCount"),
      playlistBeSubscribedCount: convertValueByType(
          jsonRes['playlistBeSubscribedCount'], int,
          stack: "Profile-playlistBeSubscribedCount"),
      followTime: convertValueByType(jsonRes['followTime'], Null,
          stack: "Profile-followTime"),
      followMe: convertValueByType(jsonRes['followMe'], bool,
          stack: "Profile-followMe"),
      artistIdentity: artistIdentity,
      cCount:
          convertValueByType(jsonRes['cCount'], int, stack: "Profile-cCount"),
      sDJPCount: convertValueByType(jsonRes['sDJPCount'], int,
          stack: "Profile-sDJPCount"),
      playlistCount: convertValueByType(jsonRes['playlistCount'], int,
          stack: "Profile-playlistCount"),
      sCount:
          convertValueByType(jsonRes['sCount'], int, stack: "Profile-sCount"),
      newFollows: convertValueByType(jsonRes['newFollows'], int,
          stack: "Profile-newFollows"),
    );
  }

  Map<String, dynamic> toJson() => {
        'vipType': vipType,
        'userType': userType,
        'createTime': createTime,
        'nickname': nickname,
        'mutual': mutual,
        'followed': followed,
        'remarkName': remarkName,
        'authStatus': authStatus,
        'detailDescription': detailDescription,
        'djStatus': djStatus,
        'accountStatus': accountStatus,
        'province': province,
        'city': city,
        'defaultAvatar': defaultAvatar,
        'backgroundImgId': backgroundImgId,
        'backgroundUrl': backgroundUrl,
        'gender': gender,
        'birthday': birthday,
        'avatarImgId': avatarImgId,
        'avatarUrl': avatarUrl,
        'avatarImgIdStr': avatarImgIdStr,
        'backgroundImgIdStr': backgroundImgIdStr,
        'description': description,
        'userId': userId,
        'signature': signature,
        'authority': authority,
        'followeds': followeds,
        'follows': follows,
        'blacklist': blacklist,
        'eventCount': eventCount,
        'allSubscribedCount': allSubscribedCount,
        'playlistBeSubscribedCount': playlistBeSubscribedCount,
        'followTime': followTime,
        'followMe': followMe,
        'artistIdentity': artistIdentity,
        'cCount': cCount,
        'sDJPCount': sDJPCount,
        'playlistCount': playlistCount,
        'sCount': sCount,
        'newFollows': newFollows,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Bindings {
  int expiresIn;
  int refreshTime;
  int bindingTime;
  Object tokenJsonStr;
  bool expired;
  String url;
  int userId;
  int id;
  int type;

  Bindings({
    this.expiresIn,
    this.refreshTime,
    this.bindingTime,
    this.tokenJsonStr,
    this.expired,
    this.url,
    this.userId,
    this.id,
    this.type,
  });

  factory Bindings.fromJson(jsonRes) => jsonRes == null
      ? null
      : Bindings(
          expiresIn: convertValueByType(jsonRes['expiresIn'], int,
              stack: "Bindings-expiresIn"),
          refreshTime: convertValueByType(jsonRes['refreshTime'], int,
              stack: "Bindings-refreshTime"),
          bindingTime: convertValueByType(jsonRes['bindingTime'], int,
              stack: "Bindings-bindingTime"),
          tokenJsonStr: convertValueByType(jsonRes['tokenJsonStr'], Null,
              stack: "Bindings-tokenJsonStr"),
          expired: convertValueByType(jsonRes['expired'], bool,
              stack: "Bindings-expired"),
          url:
              convertValueByType(jsonRes['url'], String, stack: "Bindings-url"),
          userId: convertValueByType(jsonRes['userId'], int,
              stack: "Bindings-userId"),
          id: convertValueByType(jsonRes['id'], int, stack: "Bindings-id"),
          type:
              convertValueByType(jsonRes['type'], int, stack: "Bindings-type"),
        );

  Map<String, dynamic> toJson() => {
        'expiresIn': expiresIn,
        'refreshTime': refreshTime,
        'bindingTime': bindingTime,
        'tokenJsonStr': tokenJsonStr,
        'expired': expired,
        'url': url,
        'userId': userId,
        'id': id,
        'type': type,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}
