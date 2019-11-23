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

class SearchMultipleData {
  Result result;
  int code;

  SearchMultipleData({
    this.result,
    this.code,
  });

  factory SearchMultipleData.fromJson(jsonRes) => jsonRes == null
      ? null
      : SearchMultipleData(
          result: Result.fromJson(jsonRes['result']),
          code: convertValueByType(jsonRes['code'], int,
              stack: "SearchMultipleData-code"),
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
  Song song;
  int code;
  Mlog mlog;
  PlayList playList;
  Artist artist;
  Album album;
  Video video;
  SimQuery sim_query;
  DjRadio djRadio;
  Object rec_type;
  Talk talk;
  List<Object> rec_query;
  User user;
  List<String> order;
  List<Songs> songs;
  int songCount;
  int artistCount;
  int albumCount;
  int playlistCount;
  int userprofileCount;
  List<Artists> artists;
  List<Albums> albums;
  List<PlayLists> playlists;
  List<Users> userprofiles;
  List<Videos> videos;
  int videoCount;

  Result({
    this.song,
    this.code,
    this.mlog,
    this.playList,
    this.albumCount,
    this.artist,
    this.albums,
    this.album,
    this.video,
    this.sim_query,
    this.djRadio,
    this.rec_type,
    this.talk,
    this.rec_query,
    this.user,
    this.order,
    this.songCount,
    this.artistCount,
    this.artists,
    this.playlistCount,
    this.playlists,
    this.userprofiles,
    this.userprofileCount,
    this.videoCount,
    this.videos,
    this.songs
  });

  factory Result.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> rec_query = jsonRes['rec_query'] is List ? [] : null;
    if (rec_query != null) {
      for (var item in jsonRes['rec_query']) {
        if (item != null) {
          rec_query.add(item);
        }
      }
    }
    List<PlayLists> playLists = jsonRes['playlists'] is List ? [] : null;
    if (playLists != null) {
      for (var item in jsonRes['playlists']) {
        if (item != null) {
          playLists.add(PlayLists.fromJson(item));
        }
      }
    }

    List<Videos> videos = jsonRes['videos'] is List ? [] : null;
    if (videos != null) {
      for (var item in jsonRes['videos']) {
        if (item != null) {
          videos.add(Videos.fromJson(item));
        }
      }
    }
    List<Users> userprofiles = jsonRes['userprofiles'] is List ? [] : null;
    if (userprofiles != null) {
      for (var item in jsonRes['userprofiles']) {
        if (item != null) {
          userprofiles.add(Users.fromJson(item));
        }
      }
    }

    List<Albums> albums = jsonRes['albums'] is List ? []: null;
    if(albums!=null) {
      for (var item in jsonRes['albums']) { if (item != null) { albums.add(Albums.fromJson(item));  }
      }
    }
    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }
    List<Songs> songs = jsonRes['songs'] is List ? [] : null;
    if (songs != null) {
      for (var item in jsonRes['songs']) {
        if (item != null) {
          songs.add(Songs.fromJson(item));
        }
      }
    }

    List<String> order = jsonRes['order'] is List ? [] : null;
    if (order != null) {
      for (var item in jsonRes['order']) {
        if (item != null) {
          order.add(item);
        }
      }
    }
    return Result(
      song: Song.fromJson(jsonRes['song']),
      code: convertValueByType(jsonRes['code'], int, stack: "Result-code"),
      songCount: convertValueByType(jsonRes['songCount'], int, stack: "Result-songCount"),
      albumCount: convertValueByType(jsonRes['albumCount'], int, stack: "Result-albumCount"),
      artistCount: convertValueByType(jsonRes['artistCount'], int, stack: "Result-artistCount"),
      playlistCount: convertValueByType(jsonRes['playlistCount'], int, stack: "Result-playlistCount"),
      userprofileCount: convertValueByType(jsonRes['userprofileCount'], int, stack: "Result-userprofileCount"),
      videoCount: convertValueByType(jsonRes['videoCount'], int, stack: "Result-videoCount"),
      mlog: Mlog.fromJson(jsonRes['mlog']),
      playList: PlayList.fromJson(jsonRes['playList']),
      artist: Artist.fromJson(jsonRes['artist']),
      album: Album.fromJson(jsonRes['album']),
      video: Video.fromJson(jsonRes['video']),
      sim_query: SimQuery.fromJson(jsonRes['sim_query']),
      djRadio: DjRadio.fromJson(jsonRes['djRadio']),
      rec_type: convertValueByType(jsonRes['rec_type'], Null,
          stack: "Result-rec_type"),
      talk: Talk.fromJson(jsonRes['talk']),
      rec_query: rec_query,
      user: User.fromJson(jsonRes['user']),
      order: order,
      artists: artists,
      albums: albums,
      playlists: playLists,
      videos: videos,
      userprofiles: userprofiles,
      songs: songs,
    );
  }

  Map<String, dynamic> toJson() => {
        'song': song,
        'code': code,
        'artistCount': artistCount,
        'mlog': mlog,
        'albumCount': albumCount,
        'playList': playList,
        'artist': artist,
        'album': album,
        'video': video,
        'sim_query': sim_query,
        'djRadio': djRadio,
        'rec_type': rec_type,
        'talk': talk,
        'rec_query': rec_query,
        'user': user,
        'order': order,
        'songs': songs,
        'albums': albums,
        'playlists': playlists,
        'userprofiles': userprofiles,
        'artists': artists,
        'userprofileCount': userprofileCount,
        'videoCount': videoCount,
        'videos': videos,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Song {
  String moreText;
  List<Songs> songs;
  bool more;
  List<int> resourceIds;

  Song({
    this.moreText,
    this.songs,
    this.more,
    this.resourceIds,
  });

  factory Song.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Songs> songs = jsonRes['songs'] is List ? [] : null;
    if (songs != null) {
      for (var item in jsonRes['songs']) {
        if (item != null) {
          songs.add(Songs.fromJson(item));
        }
      }
    }

    List<int> resourceIds = jsonRes['resourceIds'] is List ? [] : null;
    if (resourceIds != null) {
      for (var item in jsonRes['resourceIds']) {
        if (item != null) {
          resourceIds.add(item);
        }
      }
    }
    return Song(
      moreText: convertValueByType(jsonRes['moreText'], String,
          stack: "Song-moreText"),
      songs: songs,
      more: convertValueByType(jsonRes['more'], bool, stack: "Song-more"),
      resourceIds: resourceIds,
    );
  }

  Map<String, dynamic> toJson() => {
        'moreText': moreText,
        'songs': songs,
        'more': more,
        'resourceIds': resourceIds,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Songs {
  String name;
  int id;
  int pst;
  int t;
  List<Artists> artists;
  Album album;
  List<Ar> ar;
  List<Object> alia;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  Object crbt;
  String cf;
  Al al;
  int dt;
  H h;
  M m;
  L l;
  Object a;
  String cd;
  int no;
  Object rtUrl;
  int ftype;
  List<Object> rtUrls;
  int djId;
  int copyright;
  int s_id;
  int mark;
  int mst;
  int cp;
  int mv;
  int mvid;
  int rtype;
  Object rurl;
  int publishTime;
  bool showRecommend;
  String recommendText;
  List<Object> officialTags;
  Privilege privilege;
  String alg;

  Songs({
    this.name,
    this.id,
    this.pst,
    this.t,
    this.ar,
    this.alia,
    this.artists,
    this.album,
    this.pop,
    this.st,
    this.rt,
    this.mvid,
    this.fee,
    this.v,
    this.crbt,
    this.cf,
    this.al,
    this.dt,
    this.h,
    this.m,
    this.l,
    this.a,
    this.cd,
    this.no,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.djId,
    this.copyright,
    this.s_id,
    this.mark,
    this.mst,
    this.cp,
    this.mv,
    this.rtype,
    this.rurl,
    this.publishTime,
    this.showRecommend,
    this.recommendText,
    this.officialTags,
    this.privilege,
    this.alg,
  });

  factory Songs.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Ar> ar = jsonRes['ar'] is List ? [] : null;
    if (ar != null) {
      for (var item in jsonRes['ar']) {
        if (item != null) {
          ar.add(Ar.fromJson(item));
        }
      }
    }

    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }

    List<Object> alia = jsonRes['alia'] is List ? [] : null;
    if (alia != null) {
      for (var item in jsonRes['alia']) {
        if (item != null) {
          alia.add(item);
        }
      }
    }

    List<Object> rtUrls = jsonRes['rtUrls'] is List ? [] : null;
    if (rtUrls != null) {
      for (var item in jsonRes['rtUrls']) {
        if (item != null) {
          rtUrls.add(item);
        }
      }
    }

    List<Object> officialTags = jsonRes['officialTags'] is List ? [] : null;
    if (officialTags != null) {
      for (var item in jsonRes['officialTags']) {
        if (item != null) {
          officialTags.add(item);
        }
      }
    }
    return Songs(
      name: convertValueByType(jsonRes['name'], String, stack: "Songs-name"),
      id: convertValueByType(jsonRes['id'], int, stack: "Songs-id"),
      mvid: convertValueByType(jsonRes['mvid'], int, stack: "Songs-mvid"),
      pst: convertValueByType(jsonRes['pst'], int, stack: "Songs-pst"),
      t: convertValueByType(jsonRes['t'], int, stack: "Songs-t"),
      ar: ar,
      artists: artists,
      alia: alia,
      album: Album.fromJson(jsonRes['album']),
      pop: convertValueByType(jsonRes['pop'], int, stack: "Songs-pop"),
      st: convertValueByType(jsonRes['st'], int, stack: "Songs-st"),
      rt: convertValueByType(jsonRes['rt'], String, stack: "Songs-rt"),
      fee: convertValueByType(jsonRes['fee'], int, stack: "Songs-fee"),
      v: convertValueByType(jsonRes['v'], int, stack: "Songs-v"),
      crbt: convertValueByType(jsonRes['crbt'], Null, stack: "Songs-crbt"),
      cf: convertValueByType(jsonRes['cf'], String, stack: "Songs-cf"),
      al: Al.fromJson(jsonRes['al']),
      dt: convertValueByType(jsonRes['dt'], int, stack: "Songs-dt"),
      h: H.fromJson(jsonRes['h']),
      m: M.fromJson(jsonRes['m']),
      l: L.fromJson(jsonRes['l']),
      a: convertValueByType(jsonRes['a'], Null, stack: "Songs-a"),
      cd: convertValueByType(jsonRes['cd'], String, stack: "Songs-cd"),
      no: convertValueByType(jsonRes['no'], int, stack: "Songs-no"),
      rtUrl: convertValueByType(jsonRes['rtUrl'], Null, stack: "Songs-rtUrl"),
      ftype: convertValueByType(jsonRes['ftype'], int, stack: "Songs-ftype"),
      rtUrls: rtUrls,
      djId: convertValueByType(jsonRes['djId'], int, stack: "Songs-djId"),
      copyright: convertValueByType(jsonRes['copyright'], int,
          stack: "Songs-copyright"),
      s_id: convertValueByType(jsonRes['s_id'], int, stack: "Songs-s_id"),
      mark: convertValueByType(jsonRes['mark'], int, stack: "Songs-mark"),
      mst: convertValueByType(jsonRes['mst'], int, stack: "Songs-mst"),
      cp: convertValueByType(jsonRes['cp'], int, stack: "Songs-cp"),
      mv: convertValueByType(jsonRes['mv'], int, stack: "Songs-mv"),
      rtype: convertValueByType(jsonRes['rtype'], int, stack: "Songs-rtype"),
      rurl: convertValueByType(jsonRes['rurl'], Null, stack: "Songs-rurl"),
      publishTime: convertValueByType(jsonRes['publishTime'], int,
          stack: "Songs-publishTime"),
      showRecommend: convertValueByType(jsonRes['showRecommend'], bool,
          stack: "Songs-showRecommend"),
      recommendText: convertValueByType(jsonRes['recommendText'], String,
          stack: "Songs-recommendText"),
      officialTags: officialTags,
      privilege: Privilege.fromJson(jsonRes['privilege']),
      alg: convertValueByType(jsonRes['alg'], String, stack: "Songs-alg"),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'pst': pst,
        'mvid': mvid,
        'artists': artists,
        't': t,
        'ar': ar,
        'album': album,
        'alia': alia,
        'pop': pop,
        'st': st,
        'rt': rt,
        'fee': fee,
        'v': v,
        'crbt': crbt,
        'cf': cf,
        'al': al,
        'dt': dt,
        'h': h,
        'm': m,
        'l': l,
        'a': a,
        'cd': cd,
        'no': no,
        'rtUrl': rtUrl,
        'ftype': ftype,
        'rtUrls': rtUrls,
        'djId': djId,
        'copyright': copyright,
        's_id': s_id,
        'mark': mark,
        'mst': mst,
        'cp': cp,
        'mv': mv,
        'rtype': rtype,
        'rurl': rurl,
        'publishTime': publishTime,
        'showRecommend': showRecommend,
        'recommendText': recommendText,
        'officialTags': officialTags,
        'privilege': privilege,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Ar {
  int id;
  String name;
  List<Object> tns;
  List<String> alias;
  List<String> alia;

  Ar({
    this.id,
    this.name,
    this.tns,
    this.alias,
    this.alia,
  });

  factory Ar.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> tns = jsonRes['tns'] is List ? [] : null;
    if (tns != null) {
      for (var item in jsonRes['tns']) {
        if (item != null) {
          tns.add(item);
        }
      }
    }

    List<String> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }

    List<String> alia = jsonRes['alia'] is List ? [] : null;
    if (alia != null) {
      for (var item in jsonRes['alia']) {
        if (item != null) {
          alia.add(item);
        }
      }
    }
    return Ar(
      id: convertValueByType(jsonRes['id'], int, stack: "Ar-id"),
      name: convertValueByType(jsonRes['name'], String, stack: "Ar-name"),
      tns: tns,
      alias: alias,
      alia: alia,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tns': tns,
        'alias': alias,
        'alia': alia,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Al {
  int id;
  String name;
  String picUrl;
  List<Object> tns;
  String pic_str;
  int pic;

  Al({
    this.id,
    this.name,
    this.picUrl,
    this.tns,
    this.pic_str,
    this.pic,
  });

  factory Al.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> tns = jsonRes['tns'] is List ? [] : null;
    if (tns != null) {
      for (var item in jsonRes['tns']) {
        if (item != null) {
          tns.add(item);
        }
      }
    }
    return Al(
      id: convertValueByType(jsonRes['id'], int, stack: "Al-id"),
      name: convertValueByType(jsonRes['name'], String, stack: "Al-name"),
      picUrl: convertValueByType(jsonRes['picUrl'], String, stack: "Al-picUrl"),
      tns: tns,
      pic_str:
          convertValueByType(jsonRes['pic_str'], String, stack: "Al-pic_str"),
      pic: convertValueByType(jsonRes['pic'], int, stack: "Al-pic"),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'picUrl': picUrl,
        'tns': tns,
        'pic_str': pic_str,
        'pic': pic,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class H {
  int br;
  int fid;
  int size;
  int vd;

  H({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory H.fromJson(jsonRes) => jsonRes == null
      ? null
      : H(
          br: convertValueByType(jsonRes['br'], int, stack: "H-br"),
          fid: convertValueByType(jsonRes['fid'], int, stack: "H-fid"),
          size: convertValueByType(jsonRes['size'], int, stack: "H-size"),
          vd: convertValueByType(jsonRes['vd'], int, stack: "H-vd"),
        );

  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class M {
  int br;
  int fid;
  int size;
  int vd;

  M({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory M.fromJson(jsonRes) => jsonRes == null
      ? null
      : M(
          br: convertValueByType(jsonRes['br'], int, stack: "M-br"),
          fid: convertValueByType(jsonRes['fid'], int, stack: "M-fid"),
          size: convertValueByType(jsonRes['size'], int, stack: "M-size"),
          vd: convertValueByType(jsonRes['vd'], int, stack: "M-vd"),
        );

  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class L {
  int br;
  int fid;
  int size;
  int vd;

  L({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory L.fromJson(jsonRes) => jsonRes == null
      ? null
      : L(
          br: convertValueByType(jsonRes['br'], int, stack: "L-br"),
          fid: convertValueByType(jsonRes['fid'], int, stack: "L-fid"),
          size: convertValueByType(jsonRes['size'], int, stack: "L-size"),
          vd: convertValueByType(jsonRes['vd'], int, stack: "L-vd"),
        );

  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Privilege {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;

  Privilege({
    this.id,
    this.fee,
    this.payed,
    this.st,
    this.pl,
    this.dl,
    this.sp,
    this.cp,
    this.subp,
    this.cs,
    this.maxbr,
    this.fl,
    this.toast,
    this.flag,
  });

  factory Privilege.fromJson(jsonRes) => jsonRes == null
      ? null
      : Privilege(
          id: convertValueByType(jsonRes['id'], int, stack: "Privilege-id"),
          fee: convertValueByType(jsonRes['fee'], int, stack: "Privilege-fee"),
          payed: convertValueByType(jsonRes['payed'], int,
              stack: "Privilege-payed"),
          st: convertValueByType(jsonRes['st'], int, stack: "Privilege-st"),
          pl: convertValueByType(jsonRes['pl'], int, stack: "Privilege-pl"),
          dl: convertValueByType(jsonRes['dl'], int, stack: "Privilege-dl"),
          sp: convertValueByType(jsonRes['sp'], int, stack: "Privilege-sp"),
          cp: convertValueByType(jsonRes['cp'], int, stack: "Privilege-cp"),
          subp:
              convertValueByType(jsonRes['subp'], int, stack: "Privilege-subp"),
          cs: convertValueByType(jsonRes['cs'], bool, stack: "Privilege-cs"),
          maxbr: convertValueByType(jsonRes['maxbr'], int,
              stack: "Privilege-maxbr"),
          fl: convertValueByType(jsonRes['fl'], int, stack: "Privilege-fl"),
          toast: convertValueByType(jsonRes['toast'], bool,
              stack: "Privilege-toast"),
          flag:
              convertValueByType(jsonRes['flag'], int, stack: "Privilege-flag"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fee': fee,
        'payed': payed,
        'st': st,
        'pl': pl,
        'dl': dl,
        'sp': sp,
        'cp': cp,
        'subp': subp,
        'cs': cs,
        'maxbr': maxbr,
        'fl': fl,
        'toast': toast,
        'flag': flag,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Mlog {
  String moreText;
  bool more;
  List<Mlogs> mlogs;
  List<Object> resourceIds;

  Mlog({
    this.moreText,
    this.more,
    this.mlogs,
    this.resourceIds,
  });

  factory Mlog.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Mlogs> mlogs = jsonRes['mlogs'] is List ? [] : null;
    if (mlogs != null) {
      for (var item in jsonRes['mlogs']) {
        if (item != null) {
          mlogs.add(Mlogs.fromJson(item));
        }
      }
    }

    List<Object> resourceIds = jsonRes['resourceIds'] is List ? [] : null;
    if (resourceIds != null) {
      for (var item in jsonRes['resourceIds']) {
        if (item != null) {
          resourceIds.add(item);
        }
      }
    }
    return Mlog(
      moreText: convertValueByType(jsonRes['moreText'], String,
          stack: "Mlog-moreText"),
      more: convertValueByType(jsonRes['more'], bool, stack: "Mlog-more"),
      mlogs: mlogs,
      resourceIds: resourceIds,
    );
  }

  Map<String, dynamic> toJson() => {
        'moreText': moreText,
        'more': more,
        'mlogs': mlogs,
        'resourceIds': resourceIds,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Mlogs {
  String id;
  int type;
  Object position;
  Resource resource;
  String alg;
  Object reason;
  int matchField;
  String matchFieldContent;
  bool sameCity;

  Mlogs({
    this.id,
    this.type,
    this.position,
    this.resource,
    this.alg,
    this.reason,
    this.matchField,
    this.matchFieldContent,
    this.sameCity,
  });

  factory Mlogs.fromJson(jsonRes) => jsonRes == null
      ? null
      : Mlogs(
          id: convertValueByType(jsonRes['id'], String, stack: "Mlogs-id"),
          type: convertValueByType(jsonRes['type'], int, stack: "Mlogs-type"),
          position: convertValueByType(jsonRes['position'], Null,
              stack: "Mlogs-position"),
          resource: Resource.fromJson(jsonRes['resource']),
          alg: convertValueByType(jsonRes['alg'], String, stack: "Mlogs-alg"),
          reason: convertValueByType(jsonRes['reason'], Null,
              stack: "Mlogs-reason"),
          matchField: convertValueByType(jsonRes['matchField'], int,
              stack: "Mlogs-matchField"),
          matchFieldContent: convertValueByType(
              jsonRes['matchFieldContent'], String,
              stack: "Mlogs-matchFieldContent"),
          sameCity: convertValueByType(jsonRes['sameCity'], bool,
              stack: "Mlogs-sameCity"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'position': position,
        'resource': resource,
        'alg': alg,
        'reason': reason,
        'matchField': matchField,
        'matchFieldContent': matchFieldContent,
        'sameCity': sameCity,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Resource {
  MlogBaseData mlogBaseData;
  MlogExtVO mlogExtVO;
  UserProfile userProfile;
  int status;
  String shareUrl;

  Resource({
    this.mlogBaseData,
    this.mlogExtVO,
    this.userProfile,
    this.status,
    this.shareUrl,
  });

  factory Resource.fromJson(jsonRes) => jsonRes == null
      ? null
      : Resource(
          mlogBaseData: MlogBaseData.fromJson(jsonRes['mlogBaseData']),
          mlogExtVO: MlogExtVO.fromJson(jsonRes['mlogExtVO']),
          userProfile: UserProfile.fromJson(jsonRes['userProfile']),
          status: convertValueByType(jsonRes['status'], int,
              stack: "Resource-status"),
          shareUrl: convertValueByType(jsonRes['shareUrl'], String,
              stack: "Resource-shareUrl"),
        );

  Map<String, dynamic> toJson() => {
        'mlogBaseData': mlogBaseData,
        'mlogExtVO': mlogExtVO,
        'userProfile': userProfile,
        'status': status,
        'shareUrl': shareUrl,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class MlogBaseData {
  String id;
  int type;
  String text;
  Object interveneText;
  int pubTime;
  String coverUrl;
  int coverHeight;
  int coverWidth;
  int coverColor;
  Object coverDynamicUrl;
  Object audioDTO;
  Talk talk;
  Object mlogLocationDTO;
  Object threadId;

  MlogBaseData({
    this.id,
    this.type,
    this.text,
    this.interveneText,
    this.pubTime,
    this.coverUrl,
    this.coverHeight,
    this.coverWidth,
    this.coverColor,
    this.coverDynamicUrl,
    this.audioDTO,
    this.talk,
    this.mlogLocationDTO,
    this.threadId,
  });

  factory MlogBaseData.fromJson(jsonRes) => jsonRes == null
      ? null
      : MlogBaseData(
          id: convertValueByType(jsonRes['id'], String,
              stack: "MlogBaseData-id"),
          type: convertValueByType(jsonRes['type'], int,
              stack: "MlogBaseData-type"),
          text: convertValueByType(jsonRes['text'], String,
              stack: "MlogBaseData-text"),
          interveneText: convertValueByType(jsonRes['interveneText'], Null,
              stack: "MlogBaseData-interveneText"),
          pubTime: convertValueByType(jsonRes['pubTime'], int,
              stack: "MlogBaseData-pubTime"),
          coverUrl: convertValueByType(jsonRes['coverUrl'], String,
              stack: "MlogBaseData-coverUrl"),
          coverHeight: convertValueByType(jsonRes['coverHeight'], int,
              stack: "MlogBaseData-coverHeight"),
          coverWidth: convertValueByType(jsonRes['coverWidth'], int,
              stack: "MlogBaseData-coverWidth"),
          coverColor: convertValueByType(jsonRes['coverColor'], int,
              stack: "MlogBaseData-coverColor"),
          coverDynamicUrl: convertValueByType(jsonRes['coverDynamicUrl'], Null,
              stack: "MlogBaseData-coverDynamicUrl"),
          audioDTO: convertValueByType(jsonRes['audioDTO'], Null,
              stack: "MlogBaseData-audioDTO"),
          talk: Talk.fromJson(jsonRes['talk']),
          mlogLocationDTO: convertValueByType(jsonRes['mlogLocationDTO'], Null,
              stack: "MlogBaseData-mlogLocationDTO"),
          threadId: convertValueByType(jsonRes['threadId'], Null,
              stack: "MlogBaseData-threadId"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'text': text,
        'interveneText': interveneText,
        'pubTime': pubTime,
        'coverUrl': coverUrl,
        'coverHeight': coverHeight,
        'coverWidth': coverWidth,
        'coverColor': coverColor,
        'coverDynamicUrl': coverDynamicUrl,
        'audioDTO': audioDTO,
        'talk': talk,
        'mlogLocationDTO': mlogLocationDTO,
        'threadId': threadId,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Talk {
  int talkId;
  String talkName;
  Object participations;
  bool isFollow;

  Talk({
    this.talkId,
    this.talkName,
    this.participations,
    this.isFollow,
  });

  factory Talk.fromJson(jsonRes) => jsonRes == null
      ? null
      : Talk(
          talkId:
              convertValueByType(jsonRes['talkId'], int, stack: "Talk-talkId"),
          talkName: convertValueByType(jsonRes['talkName'], String,
              stack: "Talk-talkName"),
          participations: convertValueByType(jsonRes['participations'], Null,
              stack: "Talk-participations"),
          isFollow: convertValueByType(jsonRes['isFollow'], bool,
              stack: "Talk-isFollow"),
        );

  Map<String, dynamic> toJson() => {
        'talkId': talkId,
        'talkName': talkName,
        'participations': participations,
        'isFollow': isFollow,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class MlogExtVO {
  int likedCount;
  int commentCount;

  MlogExtVO({
    this.likedCount,
    this.commentCount,
  });

  factory MlogExtVO.fromJson(jsonRes) => jsonRes == null
      ? null
      : MlogExtVO(
          likedCount: convertValueByType(jsonRes['likedCount'], int,
              stack: "MlogExtVO-likedCount"),
          commentCount: convertValueByType(jsonRes['commentCount'], int,
              stack: "MlogExtVO-commentCount"),
        );

  Map<String, dynamic> toJson() => {
        'likedCount': likedCount,
        'commentCount': commentCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class UserProfile {
  int userId;
  String nickname;
  String avatarUrl;
  bool followed;
  int userType;
  bool isAnchor;

  UserProfile({
    this.userId,
    this.nickname,
    this.avatarUrl,
    this.followed,
    this.userType,
    this.isAnchor,
  });

  factory UserProfile.fromJson(jsonRes) => jsonRes == null
      ? null
      : UserProfile(
          userId: convertValueByType(jsonRes['userId'], int,
              stack: "UserProfile-userId"),
          nickname: convertValueByType(jsonRes['nickname'], String,
              stack: "UserProfile-nickname"),
          avatarUrl: convertValueByType(jsonRes['avatarUrl'], String,
              stack: "UserProfile-avatarUrl"),
          followed: convertValueByType(jsonRes['followed'], bool,
              stack: "UserProfile-followed"),
          userType: convertValueByType(jsonRes['userType'], int,
              stack: "UserProfile-userType"),
          isAnchor: convertValueByType(jsonRes['isAnchor'], bool,
              stack: "UserProfile-isAnchor"),
        );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'nickname': nickname,
        'avatarUrl': avatarUrl,
        'followed': followed,
        'userType': userType,
        'isAnchor': isAnchor,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class PlayList {
  String moreText;
  bool more;
  List<PlayLists> playLists;
  List<int> resourceIds;

  PlayList({
    this.moreText,
    this.more,
    this.playLists,
    this.resourceIds,
  });

  factory PlayList.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<PlayLists> playLists = jsonRes['playLists'] is List ? [] : null;
    if (playLists != null) {
      for (var item in jsonRes['playLists']) {
        if (item != null) {
          playLists.add(PlayLists.fromJson(item));
        }
      }
    }

    List<int> resourceIds = jsonRes['resourceIds'] is List ? [] : null;
    if (resourceIds != null) {
      for (var item in jsonRes['resourceIds']) {
        if (item != null) {
          resourceIds.add(item);
        }
      }
    }
    return PlayList(
      moreText: convertValueByType(jsonRes['moreText'], String,
          stack: "PlayList-moreText"),
      more: convertValueByType(jsonRes['more'], bool, stack: "PlayList-more"),
      playLists: playLists,
      resourceIds: resourceIds,
    );
  }

  Map<String, dynamic> toJson() => {
        'moreText': moreText,
        'more': more,
        'playLists': playLists,
        'resourceIds': resourceIds,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class PlayLists {
  int id;
  String name;
  String coverImgUrl;
  Creator creator;
  bool subscribed;
  int trackCount;
  int userId;
  int playCount;
  int bookCount;
  String description;
  bool highQuality;
  Track track;
  String alg;

  PlayLists({
    this.id,
    this.name,
    this.coverImgUrl,
    this.creator,
    this.subscribed,
    this.trackCount,
    this.userId,
    this.playCount,
    this.bookCount,
    this.description,
    this.highQuality,
    this.track,
    this.alg,
  });

  factory PlayLists.fromJson(jsonRes) => jsonRes == null
      ? null
      : PlayLists(
          id: convertValueByType(jsonRes['id'], int, stack: "PlayLists-id"),
          name: convertValueByType(jsonRes['name'], String,
              stack: "PlayLists-name"),
          coverImgUrl: convertValueByType(jsonRes['coverImgUrl'], String,
              stack: "PlayLists-coverImgUrl"),
          creator: Creator.fromJson(jsonRes['creator']),
          subscribed: convertValueByType(jsonRes['subscribed'], bool,
              stack: "PlayLists-subscribed"),
          trackCount: convertValueByType(jsonRes['trackCount'], int,
              stack: "PlayLists-trackCount"),
          userId: convertValueByType(jsonRes['userId'], int,
              stack: "PlayLists-userId"),
          playCount: convertValueByType(jsonRes['playCount'], int,
              stack: "PlayLists-playCount"),
          bookCount: convertValueByType(jsonRes['bookCount'], int,
              stack: "PlayLists-bookCount"),
          description: convertValueByType(jsonRes['description'], String,
              stack: "PlayLists-description"),
          highQuality: convertValueByType(jsonRes['highQuality'], bool,
              stack: "PlayLists-highQuality"),
          track: Track.fromJson(jsonRes['track']),
          alg: convertValueByType(jsonRes['alg'], String,
              stack: "PlayLists-alg"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coverImgUrl': coverImgUrl,
        'creator': creator,
        'subscribed': subscribed,
        'trackCount': trackCount,
        'userId': userId,
        'playCount': playCount,
        'bookCount': bookCount,
        'description': description,
        'highQuality': highQuality,
        'track': track,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Creator {
  String nickname;
  int userId;
  int userType;
  int authStatus;
  Object expertTags;
  Object experts;
  String userName;

  Creator({
    this.nickname,
    this.userId,
    this.userType,
    this.authStatus,
    this.expertTags,
    this.experts,
    this.userName,
  });

  factory Creator.fromJson(jsonRes) => jsonRes == null
      ? null
      : Creator(
          nickname: convertValueByType(jsonRes['nickname'], String,
              stack: "Creator-nickname"),
          userName: convertValueByType(jsonRes['userName'], String,
              stack: "Creator-userName"),
          userId: convertValueByType(jsonRes['userId'], int,
              stack: "Creator-userId"),
          userType: convertValueByType(jsonRes['userType'], int,
              stack: "Creator-userType"),
          authStatus: convertValueByType(jsonRes['authStatus'], int,
              stack: "Creator-authStatus"),
          expertTags: convertValueByType(jsonRes['expertTags'], Null,
              stack: "Creator-expertTags"),
          experts: convertValueByType(jsonRes['experts'], Null,
              stack: "Creator-experts"),
        );

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'userName': userName,
        'userId': userId,
        'userType': userType,
        'authStatus': authStatus,
        'expertTags': expertTags,
        'experts': experts,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Track {
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
  int popularity;
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
  Object hMusic;
  Object mMusic;
  LMusic lMusic;
  int rtype;
  Object rurl;
  int mvid;
  BMusic bMusic;
  Object mp3Url;

  Track({
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
    this.rtype,
    this.rurl,
    this.mvid,
    this.bMusic,
    this.mp3Url,
  });

  factory Track.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }

    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }

    List<Object> rtUrls = jsonRes['rtUrls'] is List ? [] : null;
    if (rtUrls != null) {
      for (var item in jsonRes['rtUrls']) {
        if (item != null) {
          rtUrls.add(item);
        }
      }
    }
    return Track(
      name: convertValueByType(jsonRes['name'], String, stack: "Track-name"),
      id: convertValueByType(jsonRes['id'], int, stack: "Track-id"),
      position:
          convertValueByType(jsonRes['position'], int, stack: "Track-position"),
      alias: alias,
      status: convertValueByType(jsonRes['status'], int, stack: "Track-status"),
      fee: convertValueByType(jsonRes['fee'], int, stack: "Track-fee"),
      copyrightId: convertValueByType(jsonRes['copyrightId'], int,
          stack: "Track-copyrightId"),
      disc: convertValueByType(jsonRes['disc'], String, stack: "Track-disc"),
      no: convertValueByType(jsonRes['no'], int, stack: "Track-no"),
      artists: artists,
      album: Album.fromJson(jsonRes['album']),
      starred:
          convertValueByType(jsonRes['starred'], bool, stack: "Track-starred"),
      popularity: convertValueByType(jsonRes['popularity'], int,
          stack: "Track-popularity"),
      score: convertValueByType(jsonRes['score'], int, stack: "Track-score"),
      starredNum: convertValueByType(jsonRes['starredNum'], int,
          stack: "Track-starredNum"),
      duration:
          convertValueByType(jsonRes['duration'], int, stack: "Track-duration"),
      playedNum: convertValueByType(jsonRes['playedNum'], int,
          stack: "Track-playedNum"),
      dayPlays:
          convertValueByType(jsonRes['dayPlays'], int, stack: "Track-dayPlays"),
      hearTime:
          convertValueByType(jsonRes['hearTime'], int, stack: "Track-hearTime"),
      ringtone: convertValueByType(jsonRes['ringtone'], String,
          stack: "Track-ringtone"),
      crbt: convertValueByType(jsonRes['crbt'], Null, stack: "Track-crbt"),
      audition: convertValueByType(jsonRes['audition'], Null,
          stack: "Track-audition"),
      copyFrom: convertValueByType(jsonRes['copyFrom'], String,
          stack: "Track-copyFrom"),
      commentThreadId: convertValueByType(jsonRes['commentThreadId'], String,
          stack: "Track-commentThreadId"),
      rtUrl: convertValueByType(jsonRes['rtUrl'], Null, stack: "Track-rtUrl"),
      ftype: convertValueByType(jsonRes['ftype'], int, stack: "Track-ftype"),
      rtUrls: rtUrls,
      copyright: convertValueByType(jsonRes['copyright'], int,
          stack: "Track-copyright"),
      hMusic:
          convertValueByType(jsonRes['hMusic'], Null, stack: "Track-hMusic"),
      mMusic:
          convertValueByType(jsonRes['mMusic'], Null, stack: "Track-mMusic"),
      lMusic: LMusic.fromJson(jsonRes['lMusic']),
      rtype: convertValueByType(jsonRes['rtype'], int, stack: "Track-rtype"),
      rurl: convertValueByType(jsonRes['rurl'], Null, stack: "Track-rurl"),
      mvid: convertValueByType(jsonRes['mvid'], int, stack: "Track-mvid"),
      bMusic: BMusic.fromJson(jsonRes['bMusic']),
      mp3Url:
          convertValueByType(jsonRes['mp3Url'], Null, stack: "Track-mp3Url"),
    );
  }

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
        'rtype': rtype,
        'rurl': rurl,
        'mvid': mvid,
        'bMusic': bMusic,
        'mp3Url': mp3Url,
      };

  @override
  String toString() {
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
  List<String> alias;
  String trans;
  int musicSize;
  int accountId;

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
    this.accountId,
  });

  factory Artists.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<String> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }
    return Artists(
      name: convertValueByType(jsonRes['name'], String, stack: "Artists-name"),
      id: convertValueByType(jsonRes['id'], int, stack: "Artists-id"),
      picId: convertValueByType(jsonRes['picId'], int, stack: "Artists-picId"),
      img1v1Id: convertValueByType(jsonRes['img1v1Id'], int,
          stack: "Artists-img1v1Id"),
      briefDesc: convertValueByType(jsonRes['briefDesc'], String,
          stack: "Artists-briefDesc"),
      picUrl: convertValueByType(jsonRes['picUrl'], String,
          stack: "Artists-picUrl"),
      img1v1Url: convertValueByType(jsonRes['img1v1Url'], String,
          stack: "Artists-img1v1Url"),
      albumSize: convertValueByType(jsonRes['albumSize'], int,
          stack: "Artists-albumSize"),
      accountId: convertValueByType(jsonRes['accountId'], int,
          stack: "Artists-accountId"),
      alias: alias,
      trans:
          convertValueByType(jsonRes['trans'], String, stack: "Artists-trans"),
      musicSize: convertValueByType(jsonRes['musicSize'], int,
          stack: "Artists-musicSize"),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'picId': picId,
        'img1v1Id': img1v1Id,
        'briefDesc': briefDesc,
        'picUrl': picUrl,
        'img1v1Url': img1v1Url,
        'accountId': accountId,
        'albumSize': albumSize,
        'alias': alias,
        'trans': trans,
        'musicSize': musicSize,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Album {
  String name;
  String moreText;
  int id;
  String type;
  int size;
  int picId;
  String blurPicUrl;
  String img1v1Url;
  int companyId;
  int pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
  String company;
  String briefDesc;
  Artist artist;
  List<Object> songs;
  List<Object> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String picId_str;
  List<Albums> albums;

  Album({
    this.name,
    this.moreText,
    this.id,
    this.type,
    this.size,
    this.picId,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.picUrl,
    this.img1v1Url,
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
    this.picId_str,
    this.albums
  });

  factory Album.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> songs = jsonRes['songs'] is List ? [] : null;
    if (songs != null) {
      for (var item in jsonRes['songs']) {
        if (item != null) {
          songs.add(item);
        }
      }
    }
  List<Albums> albums = jsonRes['albums'] is List ? []: null;
  if(albums!=null) {
    for (var item in jsonRes['albums']) { if (item != null) { albums.add(Albums.fromJson(item));  }
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

    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }
    return Album(
      name: convertValueByType(jsonRes['name'], String, stack: "Album-name"),
      moreText: convertValueByType(jsonRes['moreText'], String, stack: "Album-moreText"),
      id: convertValueByType(jsonRes['id'], int, stack: "Album-id"),
      type: convertValueByType(jsonRes['type'], String, stack: "Album-type"),
      img1v1Url: convertValueByType(jsonRes['img1v1Url'], String, stack: "Album-img1v1Url"),
      size: convertValueByType(jsonRes['size'], int, stack: "Album-size"),
      picId: convertValueByType(jsonRes['picId'], int, stack: "Album-picId"),
      blurPicUrl: convertValueByType(jsonRes['blurPicUrl'], String,
          stack: "Album-blurPicUrl"),
      companyId: convertValueByType(jsonRes['companyId'], int,
          stack: "Album-companyId"),
      pic: convertValueByType(jsonRes['pic'], int, stack: "Album-pic"),
      picUrl:
          convertValueByType(jsonRes['picUrl'], String, stack: "Album-picUrl"),
      publishTime: convertValueByType(jsonRes['publishTime'], int,
          stack: "Album-publishTime"),
      description: convertValueByType(jsonRes['description'], String,
          stack: "Album-description"),
      tags: convertValueByType(jsonRes['tags'], String, stack: "Album-tags"),
      company: convertValueByType(jsonRes['company'], String,
          stack: "Album-company"),
      briefDesc: convertValueByType(jsonRes['briefDesc'], String,
          stack: "Album-briefDesc"),
      artist: Artist.fromJson(jsonRes['artist']),
      songs: songs,
      albums: albums,
      alias: alias,
      status: convertValueByType(jsonRes['status'], int, stack: "Album-status"),
      copyrightId: convertValueByType(jsonRes['copyrightId'], int,
          stack: "Album-copyrightId"),
      commentThreadId: convertValueByType(jsonRes['commentThreadId'], String,
          stack: "Album-commentThreadId"),
      artists: artists,
      picId_str: convertValueByType(jsonRes['picId_str'], String,
          stack: "Album-picId_str"),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'moreText': moreText,
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
        'img1v1Url': img1v1Url,
        'artist': artist,
        'songs': songs,
        'alias': alias,
        'status': status,
        'copyrightId': copyrightId,
        'commentThreadId': commentThreadId,
        'artists': artists,
        'picId_str': picId_str,
        'albums': albums,
      };

  @override
  String toString() {
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
  String moreText;
  int musicSize;
  List<Artists> artists;

  Artist(
      {this.name,
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
      this.moreText,
      this.artists});

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
    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }
    return Artist(
      name: convertValueByType(jsonRes['name'], String, stack: "Artist-name"),
      id: convertValueByType(jsonRes['id'], int, stack: "Artist-id"),
      picId: convertValueByType(jsonRes['picId'], int, stack: "Artist-picId"),
      img1v1Id: convertValueByType(jsonRes['img1v1Id'], int,
          stack: "Artist-img1v1Id"),
      briefDesc: convertValueByType(jsonRes['briefDesc'], String,
          stack: "Artist-briefDesc"),
      moreText: convertValueByType(jsonRes['moreText'], String,
          stack: "Artist-moreText"),
      picUrl:
          convertValueByType(jsonRes['picUrl'], String, stack: "Artist-picUrl"),
      img1v1Url: convertValueByType(jsonRes['img1v1Url'], String,
          stack: "Artist-img1v1Url"),
      albumSize: convertValueByType(jsonRes['albumSize'], int,
          stack: "Artist-albumSize"),
      alias: alias,
      artists: artists,
      trans:
          convertValueByType(jsonRes['trans'], String, stack: "Artist-trans"),
      musicSize: convertValueByType(jsonRes['musicSize'], int,
          stack: "Artist-musicSize"),
    );
  }

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
        'artists': artists,
        'trans': trans,
        'moreText': moreText,
        'musicSize': musicSize,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
//
//class Artists {
//
//  String name;
//  int id;
//  int picId;
//  int img1v1Id;
//  String briefDesc;
//  String picUrl;
//  String img1v1Url;
//  int albumSize;
//  List<Object> alias;
//  String trans;
//  int musicSize;
//
//  Artists({
//    this.name,
//    this.id,
//    this.picId,
//    this.img1v1Id,
//    this.briefDesc,
//    this.picUrl,
//    this.img1v1Url,
//    this.albumSize,
//    this.alias,
//    this.trans,
//    this.musicSize,
//  });
//
//  factory Artists.fromJson(jsonRes){ if(jsonRes == null) return null;
//
//
//  List<Object> alias = jsonRes['alias'] is List ? []: null;
//  if(alias!=null) {
//    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
//    }
//  }
//  return Artists(
//    name : convertValueByType(jsonRes['name'],String,stack:"Artists-name"),
//    id : convertValueByType(jsonRes['id'],int,stack:"Artists-id"),
//    picId : convertValueByType(jsonRes['picId'],int,stack:"Artists-picId"),
//    img1v1Id : convertValueByType(jsonRes['img1v1Id'],int,stack:"Artists-img1v1Id"),
//    briefDesc : convertValueByType(jsonRes['briefDesc'],String,stack:"Artists-briefDesc"),
//    picUrl : convertValueByType(jsonRes['picUrl'],String,stack:"Artists-picUrl"),
//    img1v1Url : convertValueByType(jsonRes['img1v1Url'],String,stack:"Artists-img1v1Url"),
//    albumSize : convertValueByType(jsonRes['albumSize'],int,stack:"Artists-albumSize"),
//    alias:alias,
//    trans : convertValueByType(jsonRes['trans'],String,stack:"Artists-trans"),
//    musicSize : convertValueByType(jsonRes['musicSize'],int,stack:"Artists-musicSize"),);}
//
//  Map<String, dynamic> toJson() => {
//    'name': name,
//    'id': id,
//    'picId': picId,
//    'img1v1Id': img1v1Id,
//    'briefDesc': briefDesc,
//    'picUrl': picUrl,
//    'img1v1Url': img1v1Url,
//    'albumSize': albumSize,
//    'alias': alias,
//    'trans': trans,
//    'musicSize': musicSize,
//  };
//  @override
//  String  toString() {
//    return json.encode(this);
//  }
//}

class LMusic {
  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  int volumeDelta;

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

  factory LMusic.fromJson(jsonRes) => jsonRes == null
      ? null
      : LMusic(
          name: convertValueByType(jsonRes['name'], Null, stack: "LMusic-name"),
          id: convertValueByType(jsonRes['id'], int, stack: "LMusic-id"),
          size: convertValueByType(jsonRes['size'], int, stack: "LMusic-size"),
          extension: convertValueByType(jsonRes['extension'], String,
              stack: "LMusic-extension"),
          sr: convertValueByType(jsonRes['sr'], int, stack: "LMusic-sr"),
          dfsId:
              convertValueByType(jsonRes['dfsId'], int, stack: "LMusic-dfsId"),
          bitrate: convertValueByType(jsonRes['bitrate'], int,
              stack: "LMusic-bitrate"),
          playTime: convertValueByType(jsonRes['playTime'], int,
              stack: "LMusic-playTime"),
          volumeDelta: convertValueByType(jsonRes['volumeDelta'], int,
              stack: "LMusic-volumeDelta"),
        );

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
  String toString() {
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
  int volumeDelta;

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

  factory BMusic.fromJson(jsonRes) => jsonRes == null
      ? null
      : BMusic(
          name: convertValueByType(jsonRes['name'], Null, stack: "BMusic-name"),
          id: convertValueByType(jsonRes['id'], int, stack: "BMusic-id"),
          size: convertValueByType(jsonRes['size'], int, stack: "BMusic-size"),
          extension: convertValueByType(jsonRes['extension'], String,
              stack: "BMusic-extension"),
          sr: convertValueByType(jsonRes['sr'], int, stack: "BMusic-sr"),
          dfsId:
              convertValueByType(jsonRes['dfsId'], int, stack: "BMusic-dfsId"),
          bitrate: convertValueByType(jsonRes['bitrate'], int,
              stack: "BMusic-bitrate"),
          playTime: convertValueByType(jsonRes['playTime'], int,
              stack: "BMusic-playTime"),
          volumeDelta: convertValueByType(jsonRes['volumeDelta'], int,
              stack: "BMusic-volumeDelta"),
        );

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
  String toString() {
    return json.encode(this);
  }
}

//class Artist {
//
//  String moreText;
//  List<Artists> artists;
//  bool more;
//  List<int> resourceIds;
//
//  Artist({
//    this.moreText,
//    this.artists,
//    this.more,
//    this.resourceIds,
//  });
//
//  factory Artist.fromJson(jsonRes){ if(jsonRes == null) return null;
//
//
//  List<Artists> artists = jsonRes['artists'] is List ? []: null;
//  if(artists!=null) {
//    for (var item in jsonRes['artists']) { if (item != null) { artists.add(Artists.fromJson(item));  }
//    }
//  }
//
//
//  List<int> resourceIds = jsonRes['resourceIds'] is List ? []: null;
//  if(resourceIds!=null) {
//    for (var item in jsonRes['resourceIds']) { if (item != null) { resourceIds.add(item);  }
//    }
//  }
//  return Artist(
//    moreText : convertValueByType(jsonRes['moreText'],String,stack:"Artist-moreText"),
//    artists:artists,
//    more : convertValueByType(jsonRes['more'],bool,stack:"Artist-more"),
//    resourceIds:resourceIds,);}
//
//  Map<String, dynamic> toJson() => {
//    'moreText': moreText,
//    'artists': artists,
//    'more': more,
//    'resourceIds': resourceIds,
//  };
//  @override
//  String  toString() {
//    return json.encode(this);
//  }
//}
//
//class Artists {
//
//  int id;
//  String name;
//  String picUrl;
//  List<String> alias;
//  int albumSize;
//  int picId;
//  String img1v1Url;
//  int img1v1;
//  int mvSize;
//  bool followed;
//  String alg;
//  List<String> alia;
//  Object trans;
//
//  Artists({
//    this.id,
//    this.name,
//    this.picUrl,
//    this.alias,
//    this.albumSize,
//    this.picId,
//    this.img1v1Url,
//    this.img1v1,
//    this.mvSize,
//    this.followed,
//    this.alg,
//    this.alia,
//    this.trans,
//  });
//
//  factory Artists.fromJson(jsonRes){ if(jsonRes == null) return null;
//
//
//  List<String> alias = jsonRes['alias'] is List ? []: null;
//  if(alias!=null) {
//    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
//    }
//  }
//
//
//  List<String> alia = jsonRes['alia'] is List ? []: null;
//  if(alia!=null) {
//    for (var item in jsonRes['alia']) { if (item != null) { alia.add(item);  }
//    }
//  }
//  return Artists(
//    id : convertValueByType(jsonRes['id'],int,stack:"Artists-id"),
//    name : convertValueByType(jsonRes['name'],String,stack:"Artists-name"),
//    picUrl : convertValueByType(jsonRes['picUrl'],String,stack:"Artists-picUrl"),
//    alias:alias,
//    albumSize : convertValueByType(jsonRes['albumSize'],int,stack:"Artists-albumSize"),
//    picId : convertValueByType(jsonRes['picId'],int,stack:"Artists-picId"),
//    img1v1Url : convertValueByType(jsonRes['img1v1Url'],String,stack:"Artists-img1v1Url"),
//    img1v1 : convertValueByType(jsonRes['img1v1'],int,stack:"Artists-img1v1"),
//    mvSize : convertValueByType(jsonRes['mvSize'],int,stack:"Artists-mvSize"),
//    followed : convertValueByType(jsonRes['followed'],bool,stack:"Artists-followed"),
//    alg : convertValueByType(jsonRes['alg'],String,stack:"Artists-alg"),
//    alia:alia,
//    trans : convertValueByType(jsonRes['trans'],Null,stack:"Artists-trans"),);}
//
//  Map<String, dynamic> toJson() => {
//    'id': id,
//    'name': name,
//    'picUrl': picUrl,
//    'alias': alias,
//    'albumSize': albumSize,
//    'picId': picId,
//    'img1v1Url': img1v1Url,
//    'img1v1': img1v1,
//    'mvSize': mvSize,
//    'followed': followed,
//    'alg': alg,
//    'alia': alia,
//    'trans': trans,
//  };
//  @override
//  String  toString() {
//    return json.encode(this);
//  }
//}
//
//class Album {
//
//  String moreText;
//  List<Albums> albums;
//  bool more;
//  List<int> resourceIds;
//
//  Album({
//    this.moreText,
//    this.albums,
//    this.more,
//    this.resourceIds,
//  });
//
//  factory Album.fromJson(jsonRes){ if(jsonRes == null) return null;
//
//
//  List<Albums> albums = jsonRes['albums'] is List ? []: null;
//  if(albums!=null) {
//    for (var item in jsonRes['albums']) { if (item != null) { albums.add(Albums.fromJson(item));  }
//    }
//  }
//
//
//  List<int> resourceIds = jsonRes['resourceIds'] is List ? []: null;
//  if(resourceIds!=null) {
//    for (var item in jsonRes['resourceIds']) { if (item != null) { resourceIds.add(item);  }
//    }
//  }
//  return Album(
//    moreText : convertValueByType(jsonRes['moreText'],String,stack:"Album-moreText"),
//    albums:albums,
//    more : convertValueByType(jsonRes['more'],bool,stack:"Album-more"),
//    resourceIds:resourceIds,);}
//
//  Map<String, dynamic> toJson() => {
//    'moreText': moreText,
//    'albums': albums,
//    'more': more,
//    'resourceIds': resourceIds,
//  };
//  @override
//  String  toString() {
//    return json.encode(this);
//  }
//}

class Albums {
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
  String company;
  String briefDesc;
  Artist artist;
  Object songs;
  List<Object> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  bool paid;
  bool onSale;
  String picId_str;
  String alg;

  Albums({
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
    this.paid,
    this.onSale,
    this.picId_str,
    this.alg,
  });

  factory Albums.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }

    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }
    return Albums(
      name: convertValueByType(jsonRes['name'], String, stack: "Albums-name"),
      id: convertValueByType(jsonRes['id'], int, stack: "Albums-id"),
      type: convertValueByType(jsonRes['type'], String, stack: "Albums-type"),
      size: convertValueByType(jsonRes['size'], int, stack: "Albums-size"),
      picId: convertValueByType(jsonRes['picId'], int, stack: "Albums-picId"),
      blurPicUrl: convertValueByType(jsonRes['blurPicUrl'], String,
          stack: "Albums-blurPicUrl"),
      companyId: convertValueByType(jsonRes['companyId'], int,
          stack: "Albums-companyId"),
      pic: convertValueByType(jsonRes['pic'], int, stack: "Albums-pic"),
      picUrl:
          convertValueByType(jsonRes['picUrl'], String, stack: "Albums-picUrl"),
      publishTime: convertValueByType(jsonRes['publishTime'], int,
          stack: "Albums-publishTime"),
      description: convertValueByType(jsonRes['description'], String,
          stack: "Albums-description"),
      tags: convertValueByType(jsonRes['tags'], String, stack: "Albums-tags"),
      company: convertValueByType(jsonRes['company'], String,
          stack: "Albums-company"),
      briefDesc: convertValueByType(jsonRes['briefDesc'], String,
          stack: "Albums-briefDesc"),
      artist: Artist.fromJson(jsonRes['artist']),
      songs: convertValueByType(jsonRes['songs'], Null, stack: "Albums-songs"),
      alias: alias,
      status:
          convertValueByType(jsonRes['status'], int, stack: "Albums-status"),
      copyrightId: convertValueByType(jsonRes['copyrightId'], int,
          stack: "Albums-copyrightId"),
      commentThreadId: convertValueByType(jsonRes['commentThreadId'], String,
          stack: "Albums-commentThreadId"),
      artists: artists,
      paid: convertValueByType(jsonRes['paid'], bool, stack: "Albums-paid"),
      onSale:
          convertValueByType(jsonRes['onSale'], bool, stack: "Albums-onSale"),
      picId_str: convertValueByType(jsonRes['picId_str'], String,
          stack: "Albums-picId_str"),
      alg: convertValueByType(jsonRes['alg'], String, stack: "Albums-alg"),
    );
  }

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
        'paid': paid,
        'onSale': onSale,
        'picId_str': picId_str,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
//
//class Artist {
//
//  String name;
//  int id;
//  int picId;
//  int img1v1Id;
//  String briefDesc;
//  String picUrl;
//  String img1v1Url;
//  int albumSize;
//  List<String> alias;
//  String trans;
//  int musicSize;
//  int topicPerson;
//  String img1v1Id_str;
//  List<String> alia;
//
//  Artist({
//    this.name,
//    this.id,
//    this.picId,
//    this.img1v1Id,
//    this.briefDesc,
//    this.picUrl,
//    this.img1v1Url,
//    this.albumSize,
//    this.alias,
//    this.trans,
//    this.musicSize,
//    this.topicPerson,
//    this.img1v1Id_str,
//    this.alia,
//  });
//
//  factory Artist.fromJson(jsonRes){ if(jsonRes == null) return null;
//
//
//  List<String> alias = jsonRes['alias'] is List ? []: null;
//  if(alias!=null) {
//    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
//    }
//  }
//
//
//  List<String> alia = jsonRes['alia'] is List ? []: null;
//  if(alia!=null) {
//    for (var item in jsonRes['alia']) { if (item != null) { alia.add(item);  }
//    }
//  }
//  return Artist(
//    name : convertValueByType(jsonRes['name'],String,stack:"Artist-name"),
//    id : convertValueByType(jsonRes['id'],int,stack:"Artist-id"),
//    picId : convertValueByType(jsonRes['picId'],int,stack:"Artist-picId"),
//    img1v1Id : convertValueByType(jsonRes['img1v1Id'],int,stack:"Artist-img1v1Id"),
//    briefDesc : convertValueByType(jsonRes['briefDesc'],String,stack:"Artist-briefDesc"),
//    picUrl : convertValueByType(jsonRes['picUrl'],String,stack:"Artist-picUrl"),
//    img1v1Url : convertValueByType(jsonRes['img1v1Url'],String,stack:"Artist-img1v1Url"),
//    albumSize : convertValueByType(jsonRes['albumSize'],int,stack:"Artist-albumSize"),
//    alias:alias,
//    trans : convertValueByType(jsonRes['trans'],String,stack:"Artist-trans"),
//    musicSize : convertValueByType(jsonRes['musicSize'],int,stack:"Artist-musicSize"),
//    topicPerson : convertValueByType(jsonRes['topicPerson'],int,stack:"Artist-topicPerson"),
//    img1v1Id_str : convertValueByType(jsonRes['img1v1Id_str'],String,stack:"Artist-img1v1Id_str"),
//    alia:alia,);}
//
//  Map<String, dynamic> toJson() => {
//    'name': name,
//    'id': id,
//    'picId': picId,
//    'img1v1Id': img1v1Id,
//    'briefDesc': briefDesc,
//    'picUrl': picUrl,
//    'img1v1Url': img1v1Url,
//    'albumSize': albumSize,
//    'alias': alias,
//    'trans': trans,
//    'musicSize': musicSize,
//    'topicPerson': topicPerson,
//    'img1v1Id_str': img1v1Id_str,
//    'alia': alia,
//  };
//  @override
//  String  toString() {
//    return json.encode(this);
//  }
//}
//
//class Artists {
//
//  String name;
//  int id;
//  int picId;
//  int img1v1Id;
//  String briefDesc;
//  String picUrl;
//  String img1v1Url;
//  int albumSize;
//  List<Object> alias;
//  String trans;
//  int musicSize;
//  int topicPerson;
//  String img1v1Id_str;
//
//  Artists({
//    this.name,
//    this.id,
//    this.picId,
//    this.img1v1Id,
//    this.briefDesc,
//    this.picUrl,
//    this.img1v1Url,
//    this.albumSize,
//    this.alias,
//    this.trans,
//    this.musicSize,
//    this.topicPerson,
//    this.img1v1Id_str,
//  });
//
//  factory Artists.fromJson(jsonRes){ if(jsonRes == null) return null;
//
//
//  List<Object> alias = jsonRes['alias'] is List ? []: null;
//  if(alias!=null) {
//    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
//    }
//  }
//  return Artists(
//    name : convertValueByType(jsonRes['name'],String,stack:"Artists-name"),
//    id : convertValueByType(jsonRes['id'],int,stack:"Artists-id"),
//    picId : convertValueByType(jsonRes['picId'],int,stack:"Artists-picId"),
//    img1v1Id : convertValueByType(jsonRes['img1v1Id'],int,stack:"Artists-img1v1Id"),
//    briefDesc : convertValueByType(jsonRes['briefDesc'],String,stack:"Artists-briefDesc"),
//    picUrl : convertValueByType(jsonRes['picUrl'],String,stack:"Artists-picUrl"),
//    img1v1Url : convertValueByType(jsonRes['img1v1Url'],String,stack:"Artists-img1v1Url"),
//    albumSize : convertValueByType(jsonRes['albumSize'],int,stack:"Artists-albumSize"),
//    alias:alias,
//    trans : convertValueByType(jsonRes['trans'],String,stack:"Artists-trans"),
//    musicSize : convertValueByType(jsonRes['musicSize'],int,stack:"Artists-musicSize"),
//    topicPerson : convertValueByType(jsonRes['topicPerson'],int,stack:"Artists-topicPerson"),
//    img1v1Id_str : convertValueByType(jsonRes['img1v1Id_str'],String,stack:"Artists-img1v1Id_str"),);}
//
//  Map<String, dynamic> toJson() => {
//    'name': name,
//    'id': id,
//    'picId': picId,
//    'img1v1Id': img1v1Id,
//    'briefDesc': briefDesc,
//    'picUrl': picUrl,
//    'img1v1Url': img1v1Url,
//    'albumSize': albumSize,
//    'alias': alias,
//    'trans': trans,
//    'musicSize': musicSize,
//    'topicPerson': topicPerson,
//    'img1v1Id_str': img1v1Id_str,
//  };
//  @override
//  String  toString() {
//    return json.encode(this);
//  }
//}

class Video {
  String moreText;
  bool more;
  List<Videos> videos;
  List<int> resourceIds;

  Video({
    this.moreText,
    this.more,
    this.videos,
    this.resourceIds,
  });

  factory Video.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Videos> videos = jsonRes['videos'] is List ? [] : null;
    if (videos != null) {
      for (var item in jsonRes['videos']) {
        if (item != null) {
          videos.add(Videos.fromJson(item));
        }
      }
    }

    List<int> resourceIds = jsonRes['resourceIds'] is List ? [] : null;
    if (resourceIds != null) {
      for (var item in jsonRes['resourceIds']) {
        if (item != null) {
          resourceIds.add(item);
        }
      }
    }
    return Video(
      moreText: convertValueByType(jsonRes['moreText'], String,
          stack: "Video-moreText"),
      more: convertValueByType(jsonRes['more'], bool, stack: "Video-more"),
      videos: videos,
      resourceIds: resourceIds,
    );
  }

  Map<String, dynamic> toJson() => {
        'moreText': moreText,
        'more': more,
        'videos': videos,
        'resourceIds': resourceIds,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Videos {
  String coverUrl;
  String title;
  int durationms;
  int playTime;
  int type;
  List<Creator> creator;
  Object aliaName;
  Object transName;
  String vid;
  Object markTypes;
  String alg;

  Videos({
    this.coverUrl,
    this.title,
    this.durationms,
    this.playTime,
    this.type,
    this.creator,
    this.aliaName,
    this.transName,
    this.vid,
    this.markTypes,
    this.alg,
  });

  factory Videos.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Creator> creator = jsonRes['creator'] is List ? [] : null;
    if (creator != null) {
      for (var item in jsonRes['creator']) {
        if (item != null) {
          creator.add(Creator.fromJson(item));
        }
      }
    }
    return Videos(
      coverUrl: convertValueByType(jsonRes['coverUrl'], String,
          stack: "Videos-coverUrl"),
      title:
          convertValueByType(jsonRes['title'], String, stack: "Videos-title"),
      durationms: convertValueByType(jsonRes['durationms'], int,
          stack: "Videos-durationms"),
      playTime: convertValueByType(jsonRes['playTime'], int,
          stack: "Videos-playTime"),
      type: convertValueByType(jsonRes['type'], int, stack: "Videos-type"),
      creator: creator,
      aliaName: convertValueByType(jsonRes['aliaName'], Null,
          stack: "Videos-aliaName"),
      transName: convertValueByType(jsonRes['transName'], Null,
          stack: "Videos-transName"),
      vid: convertValueByType(jsonRes['vid'], String, stack: "Videos-vid"),
      markTypes: convertValueByType(jsonRes['markTypes'], Null,
          stack: "Videos-markTypes"),
      alg: convertValueByType(jsonRes['alg'], String, stack: "Videos-alg"),
    );
  }

  Map<String, dynamic> toJson() => {
        'coverUrl': coverUrl,
        'title': title,
        'durationms': durationms,
        'playTime': playTime,
        'type': type,
        'creator': creator,
        'aliaName': aliaName,
        'transName': transName,
        'vid': vid,
        'markTypes': markTypes,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class SimQuery {
  List<SimQuerys> sim_querys;
  bool more;

  SimQuery({
    this.sim_querys,
    this.more,
  });

  factory SimQuery.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<SimQuerys> sim_querys = jsonRes['sim_querys'] is List ? [] : null;
    if (sim_querys != null) {
      for (var item in jsonRes['sim_querys']) {
        if (item != null) {
          sim_querys.add(SimQuerys.fromJson(item));
        }
      }
    }
    return SimQuery(
      sim_querys: sim_querys,
      more: convertValueByType(jsonRes['more'], bool, stack: "SimQuery-more"),
    );
  }

  Map<String, dynamic> toJson() => {
        'sim_querys': sim_querys,
        'more': more,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class SimQuerys {
  String keyword;
  String alg;

  SimQuerys({
    this.keyword,
    this.alg,
  });

  factory SimQuerys.fromJson(jsonRes) => jsonRes == null
      ? null
      : SimQuerys(
          keyword: convertValueByType(jsonRes['keyword'], String,
              stack: "SimQuerys-keyword"),
          alg: convertValueByType(jsonRes['alg'], String,
              stack: "SimQuerys-alg"),
        );

  Map<String, dynamic> toJson() => {
        'keyword': keyword,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class DjRadio {
  String moreText;
  List<DjRadios> djRadios;
  bool more;
  List<int> resourceIds;

  DjRadio({
    this.moreText,
    this.djRadios,
    this.more,
    this.resourceIds,
  });

  factory DjRadio.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<DjRadios> djRadios = jsonRes['djRadios'] is List ? [] : null;
    if (djRadios != null) {
      for (var item in jsonRes['djRadios']) {
        if (item != null) {
          djRadios.add(DjRadios.fromJson(item));
        }
      }
    }

    List<int> resourceIds = jsonRes['resourceIds'] is List ? [] : null;
    if (resourceIds != null) {
      for (var item in jsonRes['resourceIds']) {
        if (item != null) {
          resourceIds.add(item);
        }
      }
    }
    return DjRadio(
      moreText: convertValueByType(jsonRes['moreText'], String,
          stack: "DjRadio-moreText"),
      djRadios: djRadios,
      more: convertValueByType(jsonRes['more'], bool, stack: "DjRadio-more"),
      resourceIds: resourceIds,
    );
  }

  Map<String, dynamic> toJson() => {
        'moreText': moreText,
        'djRadios': djRadios,
        'more': more,
        'resourceIds': resourceIds,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class DjRadios {
  int id;
  Dj dj;
  String name;
  String picUrl;
  String desc;
  int subCount;
  int programCount;
  int createTime;
  int categoryId;
  String category;
  int radioFeeType;
  int feeScope;
  bool buyed;
  Object videos;
  bool finished;
  bool underShelf;
  int purchaseCount;
  int price;
  int originalPrice;
  Object discountPrice;
  int lastProgramCreateTime;
  String lastProgramName;
  int lastProgramId;
  int picId;
  Object rcmdText;
  bool composeVideo;
  int shareCount;
  Object rcmdtext;
  int likedCount;
  String alg;
  int commentCount;

  DjRadios({
    this.id,
    this.dj,
    this.name,
    this.picUrl,
    this.desc,
    this.subCount,
    this.programCount,
    this.createTime,
    this.categoryId,
    this.category,
    this.radioFeeType,
    this.feeScope,
    this.buyed,
    this.videos,
    this.finished,
    this.underShelf,
    this.purchaseCount,
    this.price,
    this.originalPrice,
    this.discountPrice,
    this.lastProgramCreateTime,
    this.lastProgramName,
    this.lastProgramId,
    this.picId,
    this.rcmdText,
    this.composeVideo,
    this.shareCount,
    this.rcmdtext,
    this.likedCount,
    this.alg,
    this.commentCount,
  });

  factory DjRadios.fromJson(jsonRes) => jsonRes == null
      ? null
      : DjRadios(
          id: convertValueByType(jsonRes['id'], int, stack: "DjRadios-id"),
          dj: Dj.fromJson(jsonRes['dj']),
          name: convertValueByType(jsonRes['name'], String,
              stack: "DjRadios-name"),
          picUrl: convertValueByType(jsonRes['picUrl'], String,
              stack: "DjRadios-picUrl"),
          desc: convertValueByType(jsonRes['desc'], String,
              stack: "DjRadios-desc"),
          subCount: convertValueByType(jsonRes['subCount'], int,
              stack: "DjRadios-subCount"),
          programCount: convertValueByType(jsonRes['programCount'], int,
              stack: "DjRadios-programCount"),
          createTime: convertValueByType(jsonRes['createTime'], int,
              stack: "DjRadios-createTime"),
          categoryId: convertValueByType(jsonRes['categoryId'], int,
              stack: "DjRadios-categoryId"),
          category: convertValueByType(jsonRes['category'], String,
              stack: "DjRadios-category"),
          radioFeeType: convertValueByType(jsonRes['radioFeeType'], int,
              stack: "DjRadios-radioFeeType"),
          feeScope: convertValueByType(jsonRes['feeScope'], int,
              stack: "DjRadios-feeScope"),
          buyed: convertValueByType(jsonRes['buyed'], bool,
              stack: "DjRadios-buyed"),
          videos: convertValueByType(jsonRes['videos'], Null,
              stack: "DjRadios-videos"),
          finished: convertValueByType(jsonRes['finished'], bool,
              stack: "DjRadios-finished"),
          underShelf: convertValueByType(jsonRes['underShelf'], bool,
              stack: "DjRadios-underShelf"),
          purchaseCount: convertValueByType(jsonRes['purchaseCount'], int,
              stack: "DjRadios-purchaseCount"),
          price: convertValueByType(jsonRes['price'], int,
              stack: "DjRadios-price"),
          originalPrice: convertValueByType(jsonRes['originalPrice'], int,
              stack: "DjRadios-originalPrice"),
          discountPrice: convertValueByType(jsonRes['discountPrice'], Null,
              stack: "DjRadios-discountPrice"),
          lastProgramCreateTime: convertValueByType(
              jsonRes['lastProgramCreateTime'], int,
              stack: "DjRadios-lastProgramCreateTime"),
          lastProgramName: convertValueByType(
              jsonRes['lastProgramName'], String,
              stack: "DjRadios-lastProgramName"),
          lastProgramId: convertValueByType(jsonRes['lastProgramId'], int,
              stack: "DjRadios-lastProgramId"),
          picId: convertValueByType(jsonRes['picId'], int,
              stack: "DjRadios-picId"),
          rcmdText: convertValueByType(jsonRes['rcmdText'], Null,
              stack: "DjRadios-rcmdText"),
          composeVideo: convertValueByType(jsonRes['composeVideo'], bool,
              stack: "DjRadios-composeVideo"),
          shareCount: convertValueByType(jsonRes['shareCount'], int,
              stack: "DjRadios-shareCount"),
          rcmdtext: convertValueByType(jsonRes['rcmdtext'], Null,
              stack: "DjRadios-rcmdtext"),
          likedCount: convertValueByType(jsonRes['likedCount'], int,
              stack: "DjRadios-likedCount"),
          alg:
              convertValueByType(jsonRes['alg'], String, stack: "DjRadios-alg"),
          commentCount: convertValueByType(jsonRes['commentCount'], int,
              stack: "DjRadios-commentCount"),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dj': dj,
        'name': name,
        'picUrl': picUrl,
        'desc': desc,
        'subCount': subCount,
        'programCount': programCount,
        'createTime': createTime,
        'categoryId': categoryId,
        'category': category,
        'radioFeeType': radioFeeType,
        'feeScope': feeScope,
        'buyed': buyed,
        'videos': videos,
        'finished': finished,
        'underShelf': underShelf,
        'purchaseCount': purchaseCount,
        'price': price,
        'originalPrice': originalPrice,
        'discountPrice': discountPrice,
        'lastProgramCreateTime': lastProgramCreateTime,
        'lastProgramName': lastProgramName,
        'lastProgramId': lastProgramId,
        'picId': picId,
        'rcmdText': rcmdText,
        'composeVideo': composeVideo,
        'shareCount': shareCount,
        'rcmdtext': rcmdtext,
        'likedCount': likedCount,
        'alg': alg,
        'commentCount': commentCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Dj {
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
  int authenticationTypes;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  bool anchor;
  String avatarImgId_str;

  Dj({
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
    this.authenticationTypes,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.anchor,
    this.avatarImgId_str,
  });

  factory Dj.fromJson(jsonRes) => jsonRes == null
      ? null
      : Dj(
          defaultAvatar: convertValueByType(jsonRes['defaultAvatar'], bool,
              stack: "Dj-defaultAvatar"),
          province: convertValueByType(jsonRes['province'], int,
              stack: "Dj-province"),
          authStatus: convertValueByType(jsonRes['authStatus'], int,
              stack: "Dj-authStatus"),
          followed: convertValueByType(jsonRes['followed'], bool,
              stack: "Dj-followed"),
          avatarUrl: convertValueByType(jsonRes['avatarUrl'], String,
              stack: "Dj-avatarUrl"),
          accountStatus: convertValueByType(jsonRes['accountStatus'], int,
              stack: "Dj-accountStatus"),
          gender:
              convertValueByType(jsonRes['gender'], int, stack: "Dj-gender"),
          city: convertValueByType(jsonRes['city'], int, stack: "Dj-city"),
          birthday: convertValueByType(jsonRes['birthday'], int,
              stack: "Dj-birthday"),
          userId:
              convertValueByType(jsonRes['userId'], int, stack: "Dj-userId"),
          userType: convertValueByType(jsonRes['userType'], int,
              stack: "Dj-userType"),
          nickname: convertValueByType(jsonRes['nickname'], String,
              stack: "Dj-nickname"),
          signature: convertValueByType(jsonRes['signature'], String,
              stack: "Dj-signature"),
          description: convertValueByType(jsonRes['description'], String,
              stack: "Dj-description"),
          detailDescription: convertValueByType(
              jsonRes['detailDescription'], String,
              stack: "Dj-detailDescription"),
          avatarImgId: convertValueByType(jsonRes['avatarImgId'], int,
              stack: "Dj-avatarImgId"),
          backgroundImgId: convertValueByType(jsonRes['backgroundImgId'], int,
              stack: "Dj-backgroundImgId"),
          backgroundUrl: convertValueByType(jsonRes['backgroundUrl'], String,
              stack: "Dj-backgroundUrl"),
          authority: convertValueByType(jsonRes['authority'], int,
              stack: "Dj-authority"),
          mutual:
              convertValueByType(jsonRes['mutual'], bool, stack: "Dj-mutual"),
          expertTags: convertValueByType(jsonRes['expertTags'], Null,
              stack: "Dj-expertTags"),
          experts:
              convertValueByType(jsonRes['experts'], Null, stack: "Dj-experts"),
          djStatus: convertValueByType(jsonRes['djStatus'], int,
              stack: "Dj-djStatus"),
          vipType:
              convertValueByType(jsonRes['vipType'], int, stack: "Dj-vipType"),
          remarkName: convertValueByType(jsonRes['remarkName'], Null,
              stack: "Dj-remarkName"),
          authenticationTypes: convertValueByType(
              jsonRes['authenticationTypes'], int,
              stack: "Dj-authenticationTypes"),
          avatarImgIdStr: convertValueByType(jsonRes['avatarImgIdStr'], String,
              stack: "Dj-avatarImgIdStr"),
          backgroundImgIdStr: convertValueByType(
              jsonRes['backgroundImgIdStr'], String,
              stack: "Dj-backgroundImgIdStr"),
          anchor:
              convertValueByType(jsonRes['anchor'], bool, stack: "Dj-anchor"),
          avatarImgId_str: convertValueByType(
              jsonRes['avatarImgId_str'], String,
              stack: "Dj-avatarImgId_str"),
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
        'authenticationTypes': authenticationTypes,
        'avatarImgIdStr': avatarImgIdStr,
        'backgroundImgIdStr': backgroundImgIdStr,
        'anchor': anchor,
        'avatarImgId_str': avatarImgId_str,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Talks {
  int talkId;
  String talkName;
  ShareCover shareCover;
  ShowCover showCover;
  String talkDes;
  int follows;
  int participations;
  int showParticipations;
  int status;
  Object time;
  bool hasTag;
  String alg;
  int mlogCount;

  Talks({
    this.talkId,
    this.talkName,
    this.shareCover,
    this.showCover,
    this.talkDes,
    this.follows,
    this.participations,
    this.showParticipations,
    this.status,
    this.time,
    this.hasTag,
    this.alg,
    this.mlogCount,
  });

  factory Talks.fromJson(jsonRes) => jsonRes == null
      ? null
      : Talks(
          talkId:
              convertValueByType(jsonRes['talkId'], int, stack: "Talks-talkId"),
          talkName: convertValueByType(jsonRes['talkName'], String,
              stack: "Talks-talkName"),
          shareCover: ShareCover.fromJson(jsonRes['shareCover']),
          showCover: ShowCover.fromJson(jsonRes['showCover']),
          talkDes: convertValueByType(jsonRes['talkDes'], String,
              stack: "Talks-talkDes"),
          follows: convertValueByType(jsonRes['follows'], int,
              stack: "Talks-follows"),
          participations: convertValueByType(jsonRes['participations'], int,
              stack: "Talks-participations"),
          showParticipations: convertValueByType(
              jsonRes['showParticipations'], int,
              stack: "Talks-showParticipations"),
          status:
              convertValueByType(jsonRes['status'], int, stack: "Talks-status"),
          time: convertValueByType(jsonRes['time'], Null, stack: "Talks-time"),
          hasTag: convertValueByType(jsonRes['hasTag'], bool,
              stack: "Talks-hasTag"),
          alg: convertValueByType(jsonRes['alg'], String, stack: "Talks-alg"),
          mlogCount: convertValueByType(jsonRes['mlogCount'], int,
              stack: "Talks-mlogCount"),
        );

  Map<String, dynamic> toJson() => {
        'talkId': talkId,
        'talkName': talkName,
        'shareCover': shareCover,
        'showCover': showCover,
        'talkDes': talkDes,
        'follows': follows,
        'participations': participations,
        'showParticipations': showParticipations,
        'status': status,
        'time': time,
        'hasTag': hasTag,
        'alg': alg,
        'mlogCount': mlogCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class ShareCover {
  String picKey;
  Object nosKey;
  int width;
  int height;
  String url;

  ShareCover({
    this.picKey,
    this.nosKey,
    this.width,
    this.height,
    this.url,
  });

  factory ShareCover.fromJson(jsonRes) => jsonRes == null
      ? null
      : ShareCover(
          picKey: convertValueByType(jsonRes['picKey'], String,
              stack: "ShareCover-picKey"),
          nosKey: convertValueByType(jsonRes['nosKey'], Null,
              stack: "ShareCover-nosKey"),
          width: convertValueByType(jsonRes['width'], int,
              stack: "ShareCover-width"),
          height: convertValueByType(jsonRes['height'], int,
              stack: "ShareCover-height"),
          url: convertValueByType(jsonRes['url'], String,
              stack: "ShareCover-url"),
        );

  Map<String, dynamic> toJson() => {
        'picKey': picKey,
        'nosKey': nosKey,
        'width': width,
        'height': height,
        'url': url,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class ShowCover {
  String picKey;
  Object nosKey;
  int width;
  int height;
  String url;

  ShowCover({
    this.picKey,
    this.nosKey,
    this.width,
    this.height,
    this.url,
  });

  factory ShowCover.fromJson(jsonRes) => jsonRes == null
      ? null
      : ShowCover(
          picKey: convertValueByType(jsonRes['picKey'], String,
              stack: "ShowCover-picKey"),
          nosKey: convertValueByType(jsonRes['nosKey'], Null,
              stack: "ShowCover-nosKey"),
          width: convertValueByType(jsonRes['width'], int,
              stack: "ShowCover-width"),
          height: convertValueByType(jsonRes['height'], int,
              stack: "ShowCover-height"),
          url: convertValueByType(jsonRes['url'], String,
              stack: "ShowCover-url"),
        );

  Map<String, dynamic> toJson() => {
        'picKey': picKey,
        'nosKey': nosKey,
        'width': width,
        'height': height,
        'url': url,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class User {
  String moreText;
  bool more;
  List<Users> users;
  List<int> resourceIds;

  User({
    this.moreText,
    this.more,
    this.users,
    this.resourceIds,
  });

  factory User.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Users> users = jsonRes['users'] is List ? [] : null;
    if (users != null) {
      for (var item in jsonRes['users']) {
        if (item != null) {
          users.add(Users.fromJson(item));
        }
      }
    }

    List<int> resourceIds = jsonRes['resourceIds'] is List ? [] : null;
    if (resourceIds != null) {
      for (var item in jsonRes['resourceIds']) {
        if (item != null) {
          resourceIds.add(item);
        }
      }
    }
    return User(
      moreText: convertValueByType(jsonRes['moreText'], String,
          stack: "User-moreText"),
      more: convertValueByType(jsonRes['more'], bool, stack: "User-more"),
      users: users,
      resourceIds: resourceIds,
    );
  }

  Map<String, dynamic> toJson() => {
        'moreText': moreText,
        'more': more,
        'users': users,
        'resourceIds': resourceIds,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Users {
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
  int authenticationTypes;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  bool anchor;
  String alg;

  Users({
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
    this.authenticationTypes,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.anchor,
    this.alg,
  });

  factory Users.fromJson(jsonRes) => jsonRes == null
      ? null
      : Users(
          defaultAvatar: convertValueByType(jsonRes['defaultAvatar'], bool,
              stack: "Users-defaultAvatar"),
          province: convertValueByType(jsonRes['province'], int,
              stack: "Users-province"),
          authStatus: convertValueByType(jsonRes['authStatus'], int,
              stack: "Users-authStatus"),
          followed: convertValueByType(jsonRes['followed'], bool,
              stack: "Users-followed"),
          avatarUrl: convertValueByType(jsonRes['avatarUrl'], String,
              stack: "Users-avatarUrl"),
          accountStatus: convertValueByType(jsonRes['accountStatus'], int,
              stack: "Users-accountStatus"),
          gender:
              convertValueByType(jsonRes['gender'], int, stack: "Users-gender"),
          city: convertValueByType(jsonRes['city'], int, stack: "Users-city"),
          birthday: convertValueByType(jsonRes['birthday'], int,
              stack: "Users-birthday"),
          userId:
              convertValueByType(jsonRes['userId'], int, stack: "Users-userId"),
          userType: convertValueByType(jsonRes['userType'], int,
              stack: "Users-userType"),
          nickname: convertValueByType(jsonRes['nickname'], String,
              stack: "Users-nickname"),
          signature: convertValueByType(jsonRes['signature'], String,
              stack: "Users-signature"),
          description: convertValueByType(jsonRes['description'], String,
              stack: "Users-description"),
          detailDescription: convertValueByType(
              jsonRes['detailDescription'], String,
              stack: "Users-detailDescription"),
          avatarImgId: convertValueByType(jsonRes['avatarImgId'], int,
              stack: "Users-avatarImgId"),
          backgroundImgId: convertValueByType(jsonRes['backgroundImgId'], int,
              stack: "Users-backgroundImgId"),
          backgroundUrl: convertValueByType(jsonRes['backgroundUrl'], String,
              stack: "Users-backgroundUrl"),
          authority: convertValueByType(jsonRes['authority'], int,
              stack: "Users-authority"),
          mutual: convertValueByType(jsonRes['mutual'], bool,
              stack: "Users-mutual"),
          expertTags: convertValueByType(jsonRes['expertTags'], Null,
              stack: "Users-expertTags"),
          experts: convertValueByType(jsonRes['experts'], Null,
              stack: "Users-experts"),
          djStatus: convertValueByType(jsonRes['djStatus'], int,
              stack: "Users-djStatus"),
          vipType: convertValueByType(jsonRes['vipType'], int,
              stack: "Users-vipType"),
          remarkName: convertValueByType(jsonRes['remarkName'], Null,
              stack: "Users-remarkName"),
          authenticationTypes: convertValueByType(
              jsonRes['authenticationTypes'], int,
              stack: "Users-authenticationTypes"),
          avatarImgIdStr: convertValueByType(jsonRes['avatarImgIdStr'], String,
              stack: "Users-avatarImgIdStr"),
          backgroundImgIdStr: convertValueByType(
              jsonRes['backgroundImgIdStr'], String,
              stack: "Users-backgroundImgIdStr"),
          anchor: convertValueByType(jsonRes['anchor'], bool,
              stack: "Users-anchor"),
          alg: convertValueByType(jsonRes['alg'], String, stack: "Users-alg"),
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
        'authenticationTypes': authenticationTypes,
        'avatarImgIdStr': avatarImgIdStr,
        'backgroundImgIdStr': backgroundImgIdStr,
        'anchor': anchor,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
