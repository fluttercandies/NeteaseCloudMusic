
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


class EventContent {

  String msg;
  Video video;
  Song song;

  EventContent({
    this.msg,
    this.video,
    this.song,
  });

  factory EventContent.fromJson(jsonRes)=>jsonRes == null? null:EventContent(
    msg : convertValueByType(jsonRes['msg'],String,stack:"EventContent-msg"),
    video : Video.fromJson(jsonRes['video']),
    song : Song.fromJson(jsonRes['song']),);

  Map<String, dynamic> toJson() => {
    'msg': msg,
    'video': video,
    'song': song,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Video {

  int vid;
  String coverUrl;
  int duration;
  int playTime;
  int height;
  int width;
  int size;
  int state;
  int coverType;
  Object urlInfo;
  String videoId;
  Object threadId;
  String title;
  String description;
  Creator creator;
  int videoStatus;
  List<Resolutions> resolutions;
  bool antisChecking;
  int durationms;

  Video({
    this.vid,
    this.coverUrl,
    this.duration,
    this.playTime,
    this.height,
    this.width,
    this.size,
    this.state,
    this.coverType,
    this.urlInfo,
    this.videoId,
    this.threadId,
    this.title,
    this.description,
    this.creator,
    this.videoStatus,
    this.resolutions,
    this.antisChecking,
    this.durationms,
  });

  factory Video.fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Resolutions> resolutions = jsonRes['resolutions'] is List ? []: null;
  if(resolutions!=null) {
    for (var item in jsonRes['resolutions']) { if (item != null) { resolutions.add(Resolutions.fromJson(item));  }
    }
  }
  return Video(
    vid : convertValueByType(jsonRes['vid'],int,stack:"Video-vid"),
    coverUrl : convertValueByType(jsonRes['coverUrl'],String,stack:"Video-coverUrl"),
    duration : convertValueByType(jsonRes['duration'],int,stack:"Video-duration"),
    playTime : convertValueByType(jsonRes['playTime'],int,stack:"Video-playTime"),
    height : convertValueByType(jsonRes['height'],int,stack:"Video-height"),
    width : convertValueByType(jsonRes['width'],int,stack:"Video-width"),
    size : convertValueByType(jsonRes['size'],int,stack:"Video-size"),
    state : convertValueByType(jsonRes['state'],int,stack:"Video-state"),
    coverType : convertValueByType(jsonRes['coverType'],int,stack:"Video-coverType"),
    urlInfo : convertValueByType(jsonRes['urlInfo'],Null,stack:"Video-urlInfo"),
    videoId : convertValueByType(jsonRes['videoId'],String,stack:"Video-videoId"),
    threadId : convertValueByType(jsonRes['threadId'],Null,stack:"Video-threadId"),
    title : convertValueByType(jsonRes['title'],String,stack:"Video-title"),
    description : convertValueByType(jsonRes['description'],String,stack:"Video-description"),
    creator : Creator.fromJson(jsonRes['creator']),
    videoStatus : convertValueByType(jsonRes['videoStatus'],int,stack:"Video-videoStatus"),
    resolutions:resolutions,
    antisChecking : convertValueByType(jsonRes['antisChecking'],bool,stack:"Video-antisChecking"),
    durationms : convertValueByType(jsonRes['durationms'],int,stack:"Video-durationms"),);}

  Map<String, dynamic> toJson() => {
    'vid': vid,
    'coverUrl': coverUrl,
    'duration': duration,
    'playTime': playTime,
    'height': height,
    'width': width,
    'size': size,
    'state': state,
    'coverType': coverType,
    'urlInfo': urlInfo,
    'videoId': videoId,
    'threadId': threadId,
    'title': title,
    'description': description,
    'creator': creator,
    'videoStatus': videoStatus,
    'resolutions': resolutions,
    'antisChecking': antisChecking,
    'durationms': durationms,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Creator {

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
  String avatarImgId_str;

  Creator({
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
    this.avatarImgId_str,
  });

  factory Creator.fromJson(jsonRes)=>jsonRes == null? null:Creator(
    defaultAvatar : convertValueByType(jsonRes['defaultAvatar'],bool,stack:"Creator-defaultAvatar"),
    province : convertValueByType(jsonRes['province'],int,stack:"Creator-province"),
    authStatus : convertValueByType(jsonRes['authStatus'],int,stack:"Creator-authStatus"),
    followed : convertValueByType(jsonRes['followed'],bool,stack:"Creator-followed"),
    avatarUrl : convertValueByType(jsonRes['avatarUrl'],String,stack:"Creator-avatarUrl"),
    accountStatus : convertValueByType(jsonRes['accountStatus'],int,stack:"Creator-accountStatus"),
    gender : convertValueByType(jsonRes['gender'],int,stack:"Creator-gender"),
    city : convertValueByType(jsonRes['city'],int,stack:"Creator-city"),
    birthday : convertValueByType(jsonRes['birthday'],int,stack:"Creator-birthday"),
    userId : convertValueByType(jsonRes['userId'],int,stack:"Creator-userId"),
    userType : convertValueByType(jsonRes['userType'],int,stack:"Creator-userType"),
    nickname : convertValueByType(jsonRes['nickname'],String,stack:"Creator-nickname"),
    signature : convertValueByType(jsonRes['signature'],String,stack:"Creator-signature"),
    description : convertValueByType(jsonRes['description'],String,stack:"Creator-description"),
    detailDescription : convertValueByType(jsonRes['detailDescription'],String,stack:"Creator-detailDescription"),
    avatarImgId : convertValueByType(jsonRes['avatarImgId'],int,stack:"Creator-avatarImgId"),
    backgroundImgId : convertValueByType(jsonRes['backgroundImgId'],int,stack:"Creator-backgroundImgId"),
    backgroundUrl : convertValueByType(jsonRes['backgroundUrl'],String,stack:"Creator-backgroundUrl"),
    authority : convertValueByType(jsonRes['authority'],int,stack:"Creator-authority"),
    mutual : convertValueByType(jsonRes['mutual'],bool,stack:"Creator-mutual"),
    expertTags : convertValueByType(jsonRes['expertTags'],Null,stack:"Creator-expertTags"),
    experts : convertValueByType(jsonRes['experts'],Null,stack:"Creator-experts"),
    djStatus : convertValueByType(jsonRes['djStatus'],int,stack:"Creator-djStatus"),
    vipType : convertValueByType(jsonRes['vipType'],int,stack:"Creator-vipType"),
    remarkName : convertValueByType(jsonRes['remarkName'],Null,stack:"Creator-remarkName"),
    avatarImgIdStr : convertValueByType(jsonRes['avatarImgIdStr'],String,stack:"Creator-avatarImgIdStr"),
    backgroundImgIdStr : convertValueByType(jsonRes['backgroundImgIdStr'],String,stack:"Creator-backgroundImgIdStr"),
    avatarImgId_str : convertValueByType(jsonRes['avatarImgId_str'],String,stack:"Creator-avatarImgId_str"),);

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
    'avatarImgId_str': avatarImgId_str,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Resolutions {

  int resolution;
  int size;

  Resolutions({
    this.resolution,
    this.size,
  });

  factory Resolutions.fromJson(jsonRes)=>jsonRes == null? null:Resolutions(
    resolution : convertValueByType(jsonRes['resolution'],int,stack:"Resolutions-resolution"),
    size : convertValueByType(jsonRes['size'],int,stack:"Resolutions-size"),);

  Map<String, dynamic> toJson() => {
    'resolution': resolution,
    'size': size,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Song {

  String name;
  int id;
  int position;
  List<Object> alias;
  int status;
  int fee;
  int copyrightId;
  String disc;
  int no;
  List<Artists> artists;
  Album album;
  bool starred;
  double popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String ringtone;
  Object crbt;
  Object audition;
  String copyFrom;
  String commentThreadId;
  Object rtUrl;
  int ftype;
  List<Object> rtUrls;
  int copyright;
  HMusic hMusic;
  MMusic mMusic;
  LMusic lMusic;
  BMusic bMusic;
  Object mp3Url;
  int rtype;
  Object rurl;
  int mvid;

  Song({
    this.name,
    this.id,
    this.position,
    this.alias,
    this.status,
    this.fee,
    this.copyrightId,
    this.disc,
    this.no,
    this.artists,
    this.album,
    this.starred,
    this.popularity,
    this.score,
    this.starredNum,
    this.duration,
    this.playedNum,
    this.dayPlays,
    this.hearTime,
    this.ringtone,
    this.crbt,
    this.audition,
    this.copyFrom,
    this.commentThreadId,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.copyright,
    this.hMusic,
    this.mMusic,
    this.lMusic,
    this.bMusic,
    this.mp3Url,
    this.rtype,
    this.rurl,
    this.mvid,
  });

  factory Song.fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> alias = jsonRes['alias'] is List ? []: null;
  if(alias!=null) {
    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
    }
  }


  List<Artists> artists = jsonRes['artists'] is List ? []: null;
  if(artists!=null) {
    for (var item in jsonRes['artists']) { if (item != null) { artists.add(Artists.fromJson(item));  }
    }
  }


  List<Object> rtUrls = jsonRes['rtUrls'] is List ? []: null;
  if(rtUrls!=null) {
    for (var item in jsonRes['rtUrls']) { if (item != null) { rtUrls.add(item);  }
    }
  }
  return Song(
    name : convertValueByType(jsonRes['name'],String,stack:"Song-name"),
    id : convertValueByType(jsonRes['id'],int,stack:"Song-id"),
    position : convertValueByType(jsonRes['position'],int,stack:"Song-position"),
    alias:alias,
    status : convertValueByType(jsonRes['status'],int,stack:"Song-status"),
    fee : convertValueByType(jsonRes['fee'],int,stack:"Song-fee"),
    copyrightId : convertValueByType(jsonRes['copyrightId'],int,stack:"Song-copyrightId"),
    disc : convertValueByType(jsonRes['disc'],String,stack:"Song-disc"),
    no : convertValueByType(jsonRes['no'],int,stack:"Song-no"),
    artists:artists,
    album : Album.fromJson(jsonRes['album']),
    starred : convertValueByType(jsonRes['starred'],bool,stack:"Song-starred"),
    popularity : convertValueByType(jsonRes['popularity'],double,stack:"Song-popularity"),
    score : convertValueByType(jsonRes['score'],int,stack:"Song-score"),
    starredNum : convertValueByType(jsonRes['starredNum'],int,stack:"Song-starredNum"),
    duration : convertValueByType(jsonRes['duration'],int,stack:"Song-duration"),
    playedNum : convertValueByType(jsonRes['playedNum'],int,stack:"Song-playedNum"),
    dayPlays : convertValueByType(jsonRes['dayPlays'],int,stack:"Song-dayPlays"),
    hearTime : convertValueByType(jsonRes['hearTime'],int,stack:"Song-hearTime"),
    ringtone : convertValueByType(jsonRes['ringtone'],String,stack:"Song-ringtone"),
    crbt : convertValueByType(jsonRes['crbt'],Null,stack:"Song-crbt"),
    audition : convertValueByType(jsonRes['audition'],Null,stack:"Song-audition"),
    copyFrom : convertValueByType(jsonRes['copyFrom'],String,stack:"Song-copyFrom"),
    commentThreadId : convertValueByType(jsonRes['commentThreadId'],String,stack:"Song-commentThreadId"),
    rtUrl : convertValueByType(jsonRes['rtUrl'],Null,stack:"Song-rtUrl"),
    ftype : convertValueByType(jsonRes['ftype'],int,stack:"Song-ftype"),
    rtUrls:rtUrls,
    copyright : convertValueByType(jsonRes['copyright'],int,stack:"Song-copyright"),
    hMusic : HMusic.fromJson(jsonRes['hMusic']),
    mMusic : MMusic.fromJson(jsonRes['mMusic']),
    lMusic : LMusic.fromJson(jsonRes['lMusic']),
    bMusic : BMusic.fromJson(jsonRes['bMusic']),
    mp3Url : convertValueByType(jsonRes['mp3Url'],Null,stack:"Song-mp3Url"),
    rtype : convertValueByType(jsonRes['rtype'],int,stack:"Song-rtype"),
    rurl : convertValueByType(jsonRes['rurl'],Null,stack:"Song-rurl"),
    mvid : convertValueByType(jsonRes['mvid'],int,stack:"Song-mvid"),);}

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'position': position,
    'alias': alias,
    'status': status,
    'fee': fee,
    'copyrightId': copyrightId,
    'disc': disc,
    'no': no,
    'artists': artists,
    'album': album,
    'starred': starred,
    'popularity': popularity,
    'score': score,
    'starredNum': starredNum,
    'duration': duration,
    'playedNum': playedNum,
    'dayPlays': dayPlays,
    'hearTime': hearTime,
    'ringtone': ringtone,
    'crbt': crbt,
    'audition': audition,
    'copyFrom': copyFrom,
    'commentThreadId': commentThreadId,
    'rtUrl': rtUrl,
    'ftype': ftype,
    'rtUrls': rtUrls,
    'copyright': copyright,
    'hMusic': hMusic,
    'mMusic': mMusic,
    'lMusic': lMusic,
    'bMusic': bMusic,
    'mp3Url': mp3Url,
    'rtype': rtype,
    'rurl': rurl,
    'mvid': mvid,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Artists {

  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List<Object> alias;
  String trans;
  int musicSize;

  Artists({
    this.name,
    this.id,
    this.picId,
    this.img1v1Id,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.albumSize,
    this.alias,
    this.trans,
    this.musicSize,
  });

  factory Artists.fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> alias = jsonRes['alias'] is List ? []: null;
  if(alias!=null) {
    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
    }
  }
  return Artists(
    name : convertValueByType(jsonRes['name'],String,stack:"Artists-name"),
    id : convertValueByType(jsonRes['id'],int,stack:"Artists-id"),
    picId : convertValueByType(jsonRes['picId'],int,stack:"Artists-picId"),
    img1v1Id : convertValueByType(jsonRes['img1v1Id'],int,stack:"Artists-img1v1Id"),
    briefDesc : convertValueByType(jsonRes['briefDesc'],String,stack:"Artists-briefDesc"),
    picUrl : convertValueByType(jsonRes['picUrl'],String,stack:"Artists-picUrl"),
    img1v1Url : convertValueByType(jsonRes['img1v1Url'],String,stack:"Artists-img1v1Url"),
    albumSize : convertValueByType(jsonRes['albumSize'],int,stack:"Artists-albumSize"),
    alias:alias,
    trans : convertValueByType(jsonRes['trans'],String,stack:"Artists-trans"),
    musicSize : convertValueByType(jsonRes['musicSize'],int,stack:"Artists-musicSize"),);}

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'picId': picId,
    'img1v1Id': img1v1Id,
    'briefDesc': briefDesc,
    'picUrl': picUrl,
    'img1v1Url': img1v1Url,
    'albumSize': albumSize,
    'alias': alias,
    'trans': trans,
    'musicSize': musicSize,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Album {

  String name;
  int id;
  String type;
  int size;
  int picId;
  String blurPicUrl;
  int companyId;
  int pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
  Object company;
  String briefDesc;
  Artist artist;
  List<Object> songs;
  List<Object> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String img80x80;

  Album({
    this.name,
    this.id,
    this.type,
    this.size,
    this.picId,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.picUrl,
    this.publishTime,
    this.description,
    this.tags,
    this.company,
    this.briefDesc,
    this.artist,
    this.songs,
    this.alias,
    this.status,
    this.copyrightId,
    this.commentThreadId,
    this.artists,
    this.img80x80,
  });

  factory Album.fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> songs = jsonRes['songs'] is List ? []: null;
  if(songs!=null) {
    for (var item in jsonRes['songs']) { if (item != null) { songs.add(item);  }
    }
  }


  List<Object> alias = jsonRes['alias'] is List ? []: null;
  if(alias!=null) {
    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
    }
  }


  List<Artists> artists = jsonRes['artists'] is List ? []: null;
  if(artists!=null) {
    for (var item in jsonRes['artists']) { if (item != null) { artists.add(Artists.fromJson(item));  }
    }
  }
  return Album(
    name : convertValueByType(jsonRes['name'],String,stack:"Album-name"),
    id : convertValueByType(jsonRes['id'],int,stack:"Album-id"),
    type : convertValueByType(jsonRes['type'],String,stack:"Album-type"),
    size : convertValueByType(jsonRes['size'],int,stack:"Album-size"),
    picId : convertValueByType(jsonRes['picId'],int,stack:"Album-picId"),
    blurPicUrl : convertValueByType(jsonRes['blurPicUrl'],String,stack:"Album-blurPicUrl"),
    companyId : convertValueByType(jsonRes['companyId'],int,stack:"Album-companyId"),
    pic : convertValueByType(jsonRes['pic'],int,stack:"Album-pic"),
    picUrl : convertValueByType(jsonRes['picUrl'],String,stack:"Album-picUrl"),
    publishTime : convertValueByType(jsonRes['publishTime'],int,stack:"Album-publishTime"),
    description : convertValueByType(jsonRes['description'],String,stack:"Album-description"),
    tags : convertValueByType(jsonRes['tags'],String,stack:"Album-tags"),
    company : convertValueByType(jsonRes['company'],Null,stack:"Album-company"),
    briefDesc : convertValueByType(jsonRes['briefDesc'],String,stack:"Album-briefDesc"),
    artist : Artist.fromJson(jsonRes['artist']),
    songs:songs,
    alias:alias,
    status : convertValueByType(jsonRes['status'],int,stack:"Album-status"),
    copyrightId : convertValueByType(jsonRes['copyrightId'],int,stack:"Album-copyrightId"),
    commentThreadId : convertValueByType(jsonRes['commentThreadId'],String,stack:"Album-commentThreadId"),
    artists:artists,
    img80x80 : convertValueByType(jsonRes['img80x80'],String,stack:"Album-img80x80"),);}

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'type': type,
    'size': size,
    'picId': picId,
    'blurPicUrl': blurPicUrl,
    'companyId': companyId,
    'pic': pic,
    'picUrl': picUrl,
    'publishTime': publishTime,
    'description': description,
    'tags': tags,
    'company': company,
    'briefDesc': briefDesc,
    'artist': artist,
    'songs': songs,
    'alias': alias,
    'status': status,
    'copyrightId': copyrightId,
    'commentThreadId': commentThreadId,
    'artists': artists,
    'img80x80': img80x80,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Artist {

  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List<Object> alias;
  String trans;
  int musicSize;

  Artist({
    this.name,
    this.id,
    this.picId,
    this.img1v1Id,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.albumSize,
    this.alias,
    this.trans,
    this.musicSize,
  });

  factory Artist.fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> alias = jsonRes['alias'] is List ? []: null;
  if(alias!=null) {
    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
    }
  }
  return Artist(
    name : convertValueByType(jsonRes['name'],String,stack:"Artist-name"),
    id : convertValueByType(jsonRes['id'],int,stack:"Artist-id"),
    picId : convertValueByType(jsonRes['picId'],int,stack:"Artist-picId"),
    img1v1Id : convertValueByType(jsonRes['img1v1Id'],int,stack:"Artist-img1v1Id"),
    briefDesc : convertValueByType(jsonRes['briefDesc'],String,stack:"Artist-briefDesc"),
    picUrl : convertValueByType(jsonRes['picUrl'],String,stack:"Artist-picUrl"),
    img1v1Url : convertValueByType(jsonRes['img1v1Url'],String,stack:"Artist-img1v1Url"),
    albumSize : convertValueByType(jsonRes['albumSize'],int,stack:"Artist-albumSize"),
    alias:alias,
    trans : convertValueByType(jsonRes['trans'],String,stack:"Artist-trans"),
    musicSize : convertValueByType(jsonRes['musicSize'],int,stack:"Artist-musicSize"),);}

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'picId': picId,
    'img1v1Id': img1v1Id,
    'briefDesc': briefDesc,
    'picUrl': picUrl,
    'img1v1Url': img1v1Url,
    'albumSize': albumSize,
    'alias': alias,
    'trans': trans,
    'musicSize': musicSize,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}


class HMusic {

  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  HMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory HMusic.fromJson(jsonRes)=>jsonRes == null? null:HMusic(
    name : convertValueByType(jsonRes['name'],Null,stack:"HMusic-name"),
    id : convertValueByType(jsonRes['id'],int,stack:"HMusic-id"),
    size : convertValueByType(jsonRes['size'],int,stack:"HMusic-size"),
    extension : convertValueByType(jsonRes['extension'],String,stack:"HMusic-extension"),
    sr : convertValueByType(jsonRes['sr'],int,stack:"HMusic-sr"),
    dfsId : convertValueByType(jsonRes['dfsId'],int,stack:"HMusic-dfsId"),
    bitrate : convertValueByType(jsonRes['bitrate'],int,stack:"HMusic-bitrate"),
    playTime : convertValueByType(jsonRes['playTime'],int,stack:"HMusic-playTime"),
    volumeDelta : convertValueByType(jsonRes['volumeDelta'],double,stack:"HMusic-volumeDelta"),);

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'size': size,
    'extension': extension,
    'sr': sr,
    'dfsId': dfsId,
    'bitrate': bitrate,
    'playTime': playTime,
    'volumeDelta': volumeDelta,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class MMusic {

  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  MMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory MMusic.fromJson(jsonRes)=>jsonRes == null? null:MMusic(
    name : convertValueByType(jsonRes['name'],Null,stack:"MMusic-name"),
    id : convertValueByType(jsonRes['id'],int,stack:"MMusic-id"),
    size : convertValueByType(jsonRes['size'],int,stack:"MMusic-size"),
    extension : convertValueByType(jsonRes['extension'],String,stack:"MMusic-extension"),
    sr : convertValueByType(jsonRes['sr'],int,stack:"MMusic-sr"),
    dfsId : convertValueByType(jsonRes['dfsId'],int,stack:"MMusic-dfsId"),
    bitrate : convertValueByType(jsonRes['bitrate'],int,stack:"MMusic-bitrate"),
    playTime : convertValueByType(jsonRes['playTime'],int,stack:"MMusic-playTime"),
    volumeDelta : convertValueByType(jsonRes['volumeDelta'],double,stack:"MMusic-volumeDelta"),);

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'size': size,
    'extension': extension,
    'sr': sr,
    'dfsId': dfsId,
    'bitrate': bitrate,
    'playTime': playTime,
    'volumeDelta': volumeDelta,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class LMusic {

  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  LMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory LMusic.fromJson(jsonRes)=>jsonRes == null? null:LMusic(
    name : convertValueByType(jsonRes['name'],Null,stack:"LMusic-name"),
    id : convertValueByType(jsonRes['id'],int,stack:"LMusic-id"),
    size : convertValueByType(jsonRes['size'],int,stack:"LMusic-size"),
    extension : convertValueByType(jsonRes['extension'],String,stack:"LMusic-extension"),
    sr : convertValueByType(jsonRes['sr'],int,stack:"LMusic-sr"),
    dfsId : convertValueByType(jsonRes['dfsId'],int,stack:"LMusic-dfsId"),
    bitrate : convertValueByType(jsonRes['bitrate'],int,stack:"LMusic-bitrate"),
    playTime : convertValueByType(jsonRes['playTime'],int,stack:"LMusic-playTime"),
    volumeDelta : convertValueByType(jsonRes['volumeDelta'],double,stack:"LMusic-volumeDelta"),);

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'size': size,
    'extension': extension,
    'sr': sr,
    'dfsId': dfsId,
    'bitrate': bitrate,
    'playTime': playTime,
    'volumeDelta': volumeDelta,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class BMusic {

  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  BMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory BMusic.fromJson(jsonRes)=>jsonRes == null? null:BMusic(
    name : convertValueByType(jsonRes['name'],Null,stack:"BMusic-name"),
    id : convertValueByType(jsonRes['id'],int,stack:"BMusic-id"),
    size : convertValueByType(jsonRes['size'],int,stack:"BMusic-size"),
    extension : convertValueByType(jsonRes['extension'],String,stack:"BMusic-extension"),
    sr : convertValueByType(jsonRes['sr'],int,stack:"BMusic-sr"),
    dfsId : convertValueByType(jsonRes['dfsId'],int,stack:"BMusic-dfsId"),
    bitrate : convertValueByType(jsonRes['bitrate'],int,stack:"BMusic-bitrate"),
    playTime : convertValueByType(jsonRes['playTime'],int,stack:"BMusic-playTime"),
    volumeDelta : convertValueByType(jsonRes['volumeDelta'],double,stack:"BMusic-volumeDelta"),);

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'size': size,
    'extension': extension,
    'sr': sr,
    'dfsId': dfsId,
    'bitrate': bitrate,
    'playTime': playTime,
    'volumeDelta': volumeDelta,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}