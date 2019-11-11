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

class Root {
  Result result;
  int code;

  Root({
    this.result,
    this.code,
  });

  factory Root.fromJson(jsonRes) => jsonRes == null
      ? null
      : Root(
          result: Result.fromJson(jsonRes['result']),
          code: convertValueByType(jsonRes['code'], int, stack: "Root-code"),
        );

  Map<String, dynamic> toJson() => {
        'result': result,
        'code': code,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Result {
  List<Songs> songs;
  int songCount;

  Result({
    this.songs,
    this.songCount,
  });

  factory Result.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Songs> songs = jsonRes['songs'] is List ? [] : null;
    if (songs != null) {
      for (var item in jsonRes['songs']) {
        if (item != null) {
          songs.add(Songs.fromJson(item));
        }
      }
    }
    return Result(
      songs: songs,
      songCount: convertValueByType(jsonRes['songCount'], int,
          stack: "Result-songCount"),
    );
  }

  Map<String, dynamic> toJson() => {
        'songs': songs,
        'songCount': songCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Songs {
  int id;
  String name;
  List<Artists> artists;
  Album album;
  int duration;
  int copyrightId;
  int status;
  List<Object> alias;
  int rtype;
  int ftype;
  int mvid;
  int fee;
  Object rUrl;
  int mark;

  Songs({
    this.id,
    this.name,
    this.artists,
    this.album,
    this.duration,
    this.copyrightId,
    this.status,
    this.alias,
    this.rtype,
    this.ftype,
    this.mvid,
    this.fee,
    this.rUrl,
    this.mark,
  });

  factory Songs.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }

    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }
    return Songs(
      id: convertValueByType(jsonRes['id'], int, stack: "Songs-id"),
      name: convertValueByType(jsonRes['name'], String, stack: "Songs-name"),
      artists: artists,
      album: Album.fromJson(jsonRes['album']),
      duration:
          convertValueByType(jsonRes['duration'], int, stack: "Songs-duration"),
      copyrightId: convertValueByType(jsonRes['copyrightId'], int,
          stack: "Songs-copyrightId"),
      status: convertValueByType(jsonRes['status'], int, stack: "Songs-status"),
      alias: alias,
      rtype: convertValueByType(jsonRes['rtype'], int, stack: "Songs-rtype"),
      ftype: convertValueByType(jsonRes['ftype'], int, stack: "Songs-ftype"),
      mvid: convertValueByType(jsonRes['mvid'], int, stack: "Songs-mvid"),
      fee: convertValueByType(jsonRes['fee'], int, stack: "Songs-fee"),
      rUrl: convertValueByType(jsonRes['rUrl'], Null, stack: "Songs-rUrl"),
      mark: convertValueByType(jsonRes['mark'], int, stack: "Songs-mark"),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'artists': artists,
        'album': album,
        'duration': duration,
        'copyrightId': copyrightId,
        'status': status,
        'alias': alias,
        'rtype': rtype,
        'ftype': ftype,
        'mvid': mvid,
        'fee': fee,
        'rUrl': rUrl,
        'mark': mark,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Artists {
  int id;
  String name;
  Object picUrl;
  List<Object> alias;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;
  Object trans;

  Artists({
    this.id,
    this.name,
    this.picUrl,
    this.alias,
    this.albumSize,
    this.picId,
    this.img1v1Url,
    this.img1v1,
    this.trans,
  });

  factory Artists.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }
    return Artists(
      id: convertValueByType(jsonRes['id'], int, stack: "Artists-id"),
      name: convertValueByType(jsonRes['name'], String, stack: "Artists-name"),
      picUrl:
          convertValueByType(jsonRes['picUrl'], Null, stack: "Artists-picUrl"),
      alias: alias,
      albumSize: convertValueByType(jsonRes['albumSize'], int,
          stack: "Artists-albumSize"),
      picId: convertValueByType(jsonRes['picId'], int, stack: "Artists-picId"),
      img1v1Url: convertValueByType(jsonRes['img1v1Url'], String,
          stack: "Artists-img1v1Url"),
      img1v1:
          convertValueByType(jsonRes['img1v1'], int, stack: "Artists-img1v1"),
      trans: convertValueByType(jsonRes['trans'], Null, stack: "Artists-trans"),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'picUrl': picUrl,
        'alias': alias,
        'albumSize': albumSize,
        'picId': picId,
        'img1v1Url': img1v1Url,
        'img1v1': img1v1,
        'trans': trans,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Album {
  int id;
  String name;
  Artist artist;
  int publishTime;
  int size;
  int copyrightId;
  int status;
  int picId;
  int mark;

  Album({
    this.id,
    this.name,
    this.artist,
    this.publishTime,
    this.size,
    this.copyrightId,
    this.status,
    this.picId,
    this.mark,
  });

  factory Album.fromJson(jsonRes) => jsonRes == null
      ? null
      : Album(
          id: convertValueByType(jsonRes['id'], int, stack: "Album-id"),
          name:
              convertValueByType(jsonRes['name'], String, stack: "Album-name"),
          artist: Artist.fromJson(jsonRes['artist']),
          publishTime: convertValueByType(jsonRes['publishTime'], int,
              stack: "Album-publishTime"),
          size: convertValueByType(jsonRes['size'], int, stack: "Album-size"),
          copyrightId: convertValueByType(jsonRes['copyrightId'], int,
              stack: "Album-copyrightId"),
          status:
              convertValueByType(jsonRes['status'], int, stack: "Album-status"),
          picId:
              convertValueByType(jsonRes['picId'], int, stack: "Album-picId"),
          mark: convertValueByType(jsonRes['mark'], int, stack: "Album-mark"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'artist': artist,
        'publishTime': publishTime,
        'size': size,
        'copyrightId': copyrightId,
        'status': status,
        'picId': picId,
        'mark': mark,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Artist {
  int id;
  String name;
  Object picUrl;
  List<Object> alias;
  int albumSize;
  int picId;
  String img1v1Url;
  int img1v1;
  Object trans;

  Artist({
    this.id,
    this.name,
    this.picUrl,
    this.alias,
    this.albumSize,
    this.picId,
    this.img1v1Url,
    this.img1v1,
    this.trans,
  });

  factory Artist.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }
    return Artist(
      id: convertValueByType(jsonRes['id'], int, stack: "Artist-id"),
      name: convertValueByType(jsonRes['name'], String, stack: "Artist-name"),
      picUrl:
          convertValueByType(jsonRes['picUrl'], Null, stack: "Artist-picUrl"),
      alias: alias,
      albumSize: convertValueByType(jsonRes['albumSize'], int,
          stack: "Artist-albumSize"),
      picId: convertValueByType(jsonRes['picId'], int, stack: "Artist-picId"),
      img1v1Url: convertValueByType(jsonRes['img1v1Url'], String,
          stack: "Artist-img1v1Url"),
      img1v1:
          convertValueByType(jsonRes['img1v1'], int, stack: "Artist-img1v1"),
      trans: convertValueByType(jsonRes['trans'], Null, stack: "Artist-trans"),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'picUrl': picUrl,
        'alias': alias,
        'albumSize': albumSize,
        'picId': picId,
        'img1v1Url': img1v1Url,
        'img1v1': img1v1,
        'trans': trans,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
