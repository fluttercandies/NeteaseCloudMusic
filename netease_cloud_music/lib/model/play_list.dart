class MyPlayListData{
  num _code;
  List<Playlist> playlist;

  MyPlayListData.fromJson(Map<String, dynamic> json) {
    _code = json['code'];

    if (json['playlist'] != null) {
      playlist = new List<Playlist>();
      json['playlist'].forEach((v) {
        playlist.add(new Playlist.fromJson(v));
      });
    }


    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['code'] = this._code;
      if (this.playlist != null) {
        data['playlist'] = this.playlist.map((v) => v.toJson()).toList();
      }
      return data;
    }

  }
}



class PlayListData {
  num _code;
  Null _relatedVideos;
  Playlist _playlist;

  PlayListData({num code, Null relatedVideos, Playlist playlist}) {
    this._code = code;
    this._relatedVideos = relatedVideos;
    this._playlist = playlist;
  }

  num get code => _code;
  set code(num code) => _code = code;
  Null get relatedVideos => _relatedVideos;
  set relatedVideos(Null relatedVideos) => _relatedVideos = relatedVideos;
  Playlist get playlist => _playlist;
  set playlist(Playlist playlist) => _playlist = playlist;

  PlayListData.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _relatedVideos = json['relatedVideos'];
    _playlist = json['playlist'] != null
        ? new Playlist.fromJson(json['playlist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['relatedVideos'] = this._relatedVideos;
    if (this._playlist != null) {
      data['playlist'] = this._playlist.toJson();
    }
    return data;
  }
}

class Playlist {
  List<Subscribers> _subscribers;
  bool _subscribed;
  Subscribers _creator;
  List<Tracks> _tracks;
  List<TrackIds> _trackIds;
  num _backgroundCoverId;
  num _titleImage;
  num _subscribedCount;
  num _cloudTrackCount;
  bool _ordered;
  List<String> _tags;
  num _createTime;
  bool _highQuality;
  num _playCount;
  num _trackNumberUpdateTime;
  num _trackUpdateTime;
  num _userId;
  String _coverImgUrl;
  num _trackCount;
  bool _newImported;
  num _coverImgId;
  num _updateTime;
  num _specialType;
  String _commentThreadId;
  num _privacy;
  String _description;
  num _adType;
  num _status;
  String _name;
  num _id;
  num _shareCount;
  num _commentCount;
  int type; // 1 为删除，2 为更改

  Playlist(
      {List<Subscribers> subscribers,
        bool subscribed,
        Subscribers creator,
        List<Tracks> tracks,
        List<TrackIds> trackIds,
        num backgroundCoverId,
        num titleImage,
        num subscribedCount,
        num cloudTrackCount,
        bool ordered,
        List<String> tags,
        num createTime,
        bool highQuality,
        num playCount,
        num trackNumberUpdateTime,
        num trackUpdateTime,
        num userId,
        String coverImgUrl,
        num trackCount,
        bool newImported,
        num coverImgId,
        num updateTime,
        num specialType,
        String commentThreadId,
        num privacy,
        String description,
        num adType,
        num status,
        String name,
        num id,
        num shareCount,
        num commentCount}) {
    this._subscribers = subscribers;
    this._subscribed = subscribed;
    this._creator = creator;
    this._tracks = tracks;
    this._trackIds = trackIds;
    this._backgroundCoverId = backgroundCoverId;
    this._titleImage = titleImage;
    this._subscribedCount = subscribedCount;
    this._cloudTrackCount = cloudTrackCount;
    this._ordered = ordered;
    this._tags = tags;
    this._createTime = createTime;
    this._highQuality = highQuality;
    this._playCount = playCount;
    this._trackNumberUpdateTime = trackNumberUpdateTime;
    this._trackUpdateTime = trackUpdateTime;
    this._userId = userId;
    this._coverImgUrl = coverImgUrl;
    this._trackCount = trackCount;
    this._newImported = newImported;
    this._coverImgId = coverImgId;
    this._updateTime = updateTime;
    this._specialType = specialType;
    this._commentThreadId = commentThreadId;
    this._privacy = privacy;
    this._description = description;
    this._adType = adType;
    this._status = status;
    this._name = name;
    this._id = id;
    this._shareCount = shareCount;
    this._commentCount = commentCount;
  }

  List<Subscribers> get subscribers => _subscribers;
  set subscribers(List<Subscribers> subscribers) => _subscribers = subscribers;
  bool get subscribed => _subscribed;
  set subscribed(bool subscribed) => _subscribed = subscribed;
  Subscribers get creator => _creator;
  set creator(Subscribers creator) => _creator = creator;
  List<Tracks> get tracks => _tracks;
  set tracks(List<Tracks> tracks) => _tracks = tracks;
  List<TrackIds> get trackIds => _trackIds;
  set trackIds(List<TrackIds> trackIds) => _trackIds = trackIds;
  num get backgroundCoverId => _backgroundCoverId;
  set backgroundCoverId(num backgroundCoverId) =>
      _backgroundCoverId = backgroundCoverId;
  num get titleImage => _titleImage;
  set titleImage(num titleImage) => _titleImage = titleImage;
  num get subscribedCount => _subscribedCount;
  set subscribedCount(num subscribedCount) =>
      _subscribedCount = subscribedCount;
  num get cloudTrackCount => _cloudTrackCount;
  set cloudTrackCount(num cloudTrackCount) =>
      _cloudTrackCount = cloudTrackCount;
  bool get ordered => _ordered;
  set ordered(bool ordered) => _ordered = ordered;
  List<String> get tags => _tags;
  set tags(List<String> tags) => _tags = tags;
  num get createTime => _createTime;
  set createTime(num createTime) => _createTime = createTime;
  bool get highQuality => _highQuality;
  set highQuality(bool highQuality) => _highQuality = highQuality;
  num get playCount => _playCount;
  set playCount(num playCount) => _playCount = playCount;
  num get trackNumberUpdateTime => _trackNumberUpdateTime;
  set trackNumberUpdateTime(num trackNumberUpdateTime) =>
      _trackNumberUpdateTime = trackNumberUpdateTime;
  num get trackUpdateTime => _trackUpdateTime;
  set trackUpdateTime(num trackUpdateTime) =>
      _trackUpdateTime = trackUpdateTime;
  num get userId => _userId;
  set userId(num userId) => _userId = userId;
  String get coverImgUrl => _coverImgUrl;
  set coverImgUrl(String coverImgUrl) => _coverImgUrl = coverImgUrl;
  num get trackCount => _trackCount;
  set trackCount(num trackCount) => _trackCount = trackCount;
  bool get newImported => _newImported;
  set newImported(bool newImported) => _newImported = newImported;
  num get coverImgId => _coverImgId;
  set coverImgId(num coverImgId) => _coverImgId = coverImgId;
  num get updateTime => _updateTime;
  set updateTime(num updateTime) => _updateTime = updateTime;
  num get specialType => _specialType;
  set specialType(num specialType) => _specialType = specialType;
  String get commentThreadId => _commentThreadId;
  set commentThreadId(String commentThreadId) =>
      _commentThreadId = commentThreadId;
  num get privacy => _privacy;
  set privacy(num privacy) => _privacy = privacy;
  String get description => _description;
  set description(String description) => _description = description;
  num get adType => _adType;
  set adType(num adType) => _adType = adType;
  num get status => _status;
  set status(num status) => _status = status;
  String get name => _name;
  set name(String name) => _name = name;
  num get id => _id;
  set id(num id) => _id = id;
  num get shareCount => _shareCount;
  set shareCount(num shareCount) => _shareCount = shareCount;
  num get commentCount => _commentCount;
  set commentCount(num commentCount) => _commentCount = commentCount;

  Playlist.fromJson(Map<String, dynamic> json) {
    if (json['subscribers'] != null) {
      _subscribers = new List<Subscribers>();
      json['subscribers'].forEach((v) {
        _subscribers.add(new Subscribers.fromJson(v));
      });
    }
    _subscribed = json['subscribed'];
    _creator =
    json['creator'] != null ? new Subscribers.fromJson(json['creator']) : null;
    if (json['tracks'] != null) {
      _tracks = new List<Tracks>();
      json['tracks'].forEach((v) {
        _tracks.add(new Tracks.fromJson(v));
      });
    }
    if (json['trackIds'] != null) {
      _trackIds = new List<TrackIds>();
      json['trackIds'].forEach((v) {
        _trackIds.add(new TrackIds.fromJson(v));
      });
    }
    _backgroundCoverId = json['backgroundCoverId'];
    _titleImage = json['titleImage'];
    _subscribedCount = json['subscribedCount'];
    _cloudTrackCount = json['cloudTrackCount'];
    _ordered = json['ordered'];
    _tags = json['tags'].cast<String>();
    _createTime = json['createTime'];
    _highQuality = json['highQuality'];
    _playCount = json['playCount'];
    _trackNumberUpdateTime = json['trackNumberUpdateTime'];
    _trackUpdateTime = json['trackUpdateTime'];
    _userId = json['userId'];
    _coverImgUrl = json['coverImgUrl'];
    _trackCount = json['trackCount'];
    _newImported = json['newImported'];
    _coverImgId = json['coverImgId'];
    _updateTime = json['updateTime'];
    _specialType = json['specialType'];
    _commentThreadId = json['commentThreadId'];
    _privacy = json['privacy'];
    _description = json['description'];
    _adType = json['adType'];
    _status = json['status'];
    _name = json['name'];
    _id = json['id'];
    _shareCount = json['shareCount'];
    _commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._subscribers != null) {
      data['subscribers'] = this._subscribers.map((v) => v.toJson()).toList();
    }
    data['subscribed'] = this._subscribed;
    if (this._creator != null) {
      data['creator'] = this._creator.toJson();
    }
    if (this._tracks != null) {
      data['tracks'] = this._tracks.map((v) => v.toJson()).toList();
    }
    if (this._trackIds != null) {
      data['trackIds'] = this._trackIds.map((v) => v.toJson()).toList();
    }
    data['backgroundCoverId'] = this._backgroundCoverId;
    data['titleImage'] = this._titleImage;
    data['subscribedCount'] = this._subscribedCount;
    data['cloudTrackCount'] = this._cloudTrackCount;
    data['ordered'] = this._ordered;
    data['tags'] = this._tags;
    data['createTime'] = this._createTime;
    data['highQuality'] = this._highQuality;
    data['playCount'] = this._playCount;
    data['trackNumberUpdateTime'] = this._trackNumberUpdateTime;
    data['trackUpdateTime'] = this._trackUpdateTime;
    data['userId'] = this._userId;
    data['coverImgUrl'] = this._coverImgUrl;
    data['trackCount'] = this._trackCount;
    data['newImported'] = this._newImported;
    data['coverImgId'] = this._coverImgId;
    data['updateTime'] = this._updateTime;
    data['specialType'] = this._specialType;
    data['commentThreadId'] = this._commentThreadId;
    data['privacy'] = this._privacy;
    data['description'] = this._description;
    data['adType'] = this._adType;
    data['status'] = this._status;
    data['name'] = this._name;
    data['id'] = this._id;
    data['shareCount'] = this._shareCount;
    data['commentCount'] = this._commentCount;
    return data;
  }
}

class Subscribers {
  bool _defaultAvatar;
  num _province;
  num _authStatus;
  bool _followed;
  String _avatarUrl;
  num _accountStatus;
  num _gender;
  num _city;
  num _birthday;
  num _userId;
  num _userType;
  String _nickname;
  String _signature;
  String _description;
  String _detailDescription;
  num _avatarImgId;
  num _backgroundImgId;
  String _backgroundUrl;
  num _authority;
  bool _mutual;
  num _djStatus;
  num _vipType;
  String _avatarImgIdStr;
  String _backgroundImgIdStr;

  Subscribers(
      {bool defaultAvatar,
        num province,
        num authStatus,
        bool followed,
        String avatarUrl,
        num accountStatus,
        num gender,
        num city,
        num birthday,
        num userId,
        num userType,
        String nickname,
        String signature,
        String description,
        String detailDescription,
        num avatarImgId,
        num backgroundImgId,
        String backgroundUrl,
        num authority,
        bool mutual,
        num djStatus,
        num vipType,
        String avatarImgIdStr,
        String backgroundImgIdStr}) {
    this._defaultAvatar = defaultAvatar;
    this._province = province;
    this._authStatus = authStatus;
    this._followed = followed;
    this._avatarUrl = avatarUrl;
    this._accountStatus = accountStatus;
    this._gender = gender;
    this._city = city;
    this._birthday = birthday;
    this._userId = userId;
    this._userType = userType;
    this._nickname = nickname;
    this._signature = signature;
    this._description = description;
    this._detailDescription = detailDescription;
    this._avatarImgId = avatarImgId;
    this._backgroundImgId = backgroundImgId;
    this._backgroundUrl = backgroundUrl;
    this._authority = authority;
    this._mutual = mutual;
    this._djStatus = djStatus;
    this._vipType = vipType;
    this._avatarImgIdStr = avatarImgIdStr;
    this._backgroundImgIdStr = backgroundImgIdStr;
    this._avatarImgIdStr = avatarImgIdStr;
  }

  bool get defaultAvatar => _defaultAvatar;
  set defaultAvatar(bool defaultAvatar) => _defaultAvatar = defaultAvatar;
  num get province => _province;
  set province(num province) => _province = province;
  num get authStatus => _authStatus;
  set authStatus(num authStatus) => _authStatus = authStatus;
  bool get followed => _followed;
  set followed(bool followed) => _followed = followed;
  String get avatarUrl => _avatarUrl;
  set avatarUrl(String avatarUrl) => _avatarUrl = avatarUrl;
  num get accountStatus => _accountStatus;
  set accountStatus(num accountStatus) => _accountStatus = accountStatus;
  num get gender => _gender;
  set gender(num gender) => _gender = gender;
  num get city => _city;
  set city(num city) => _city = city;
  num get birthday => _birthday;
  set birthday(num birthday) => _birthday = birthday;
  num get userId => _userId;
  set userId(num userId) => _userId = userId;
  num get userType => _userType;
  set userType(num userType) => _userType = userType;
  String get nickname => _nickname;
  set nickname(String nickname) => _nickname = nickname;
  String get signature => _signature;
  set signature(String signature) => _signature = signature;
  String get description => _description;
  set description(String description) => _description = description;
  String get detailDescription => _detailDescription;
  set detailDescription(String detailDescription) =>
      _detailDescription = detailDescription;
  num get avatarImgId => _avatarImgId;
  set avatarImgId(num avatarImgId) => _avatarImgId = avatarImgId;
  num get backgroundImgId => _backgroundImgId;
  set backgroundImgId(num backgroundImgId) =>
      _backgroundImgId = backgroundImgId;
  String get backgroundUrl => _backgroundUrl;
  set backgroundUrl(String backgroundUrl) => _backgroundUrl = backgroundUrl;
  num get authority => _authority;
  set authority(num authority) => _authority = authority;
  bool get mutual => _mutual;
  set mutual(bool mutual) => _mutual = mutual;
  num get djStatus => _djStatus;
  set djStatus(num djStatus) => _djStatus = djStatus;
  num get vipType => _vipType;
  set vipType(num vipType) => _vipType = vipType;
  String get avatarImgIdStr => _avatarImgIdStr;
  set avatarImgIdStr(String avatarImgIdStr) => _avatarImgIdStr = avatarImgIdStr;
  String get backgroundImgIdStr => _backgroundImgIdStr;
  set backgroundImgIdStr(String backgroundImgIdStr) =>
      _backgroundImgIdStr = backgroundImgIdStr;

  Subscribers.fromJson(Map<String, dynamic> json) {
    _defaultAvatar = json['defaultAvatar'];
    _province = json['province'];
    _authStatus = json['authStatus'];
    _followed = json['followed'];
    _avatarUrl = json['avatarUrl'];
    _accountStatus = json['accountStatus'];
    _gender = json['gender'];
    _city = json['city'];
    _birthday = json['birthday'];
    _userId = json['userId'];
    _userType = json['userType'];
    _nickname = json['nickname'];
    _signature = json['signature'];
    _description = json['description'];
    _detailDescription = json['detailDescription'];
    _avatarImgId = json['avatarImgId'];
    _backgroundImgId = json['backgroundImgId'];
    _backgroundUrl = json['backgroundUrl'];
    _authority = json['authority'];
    _mutual = json['mutual'];
    _djStatus = json['djStatus'];
    _vipType = json['vipType'];
    _avatarImgIdStr = json['avatarImgIdStr'];
    _backgroundImgIdStr = json['backgroundImgIdStr'];
    _avatarImgIdStr = json['avatarImgId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this._defaultAvatar;
    data['province'] = this._province;
    data['authStatus'] = this._authStatus;
    data['followed'] = this._followed;
    data['avatarUrl'] = this._avatarUrl;
    data['accountStatus'] = this._accountStatus;
    data['gender'] = this._gender;
    data['city'] = this._city;
    data['birthday'] = this._birthday;
    data['userId'] = this._userId;
    data['userType'] = this._userType;
    data['nickname'] = this._nickname;
    data['signature'] = this._signature;
    data['description'] = this._description;
    data['detailDescription'] = this._detailDescription;
    data['avatarImgId'] = this._avatarImgId;
    data['backgroundImgId'] = this._backgroundImgId;
    data['backgroundUrl'] = this._backgroundUrl;
    data['authority'] = this._authority;
    data['mutual'] = this._mutual;
    data['djStatus'] = this._djStatus;
    data['vipType'] = this._vipType;
    data['avatarImgIdStr'] = this._avatarImgIdStr;
    data['backgroundImgIdStr'] = this._backgroundImgIdStr;
    data['avatarImgId_str'] = this._avatarImgIdStr;
    return data;
  }
}

class Tracks {
  String _name;
  num _id;
  num _pst;
  num _t;
  List<Ar> _ar;
  num _pop;
  num _st;
  String _rt;
  num _fee;
  num _v;
  String _cf;
  Al _al;
  num _dt;
  H _h;
  H _m;
  H _l;
  String _cd;
  num _no;
  num _ftype;
  num _djId;
  num _copyright;
  num _sId;
  num _mark;
  num _mv;
  num _rtype;
  num _mst;
  num _cp;
  num _publishTime;

  Tracks(
      {String name,
        num id,
        num pst,
        num t,
        List<Ar> ar,
        num pop,
        num st,
        String rt,
        num fee,
        num v,
        String cf,
        Al al,
        num dt,
        H h,
        H m,
        H l,
        String cd,
        num no,
        num ftype,
        num djId,
        num copyright,
        num sId,
        num mark,
        num mv,
        num rtype,
        num mst,
        num cp,
        num publishTime}) {
    this._name = name;
    this._id = id;
    this._pst = pst;
    this._t = t;
    this._ar = ar;
    this._pop = pop;
    this._st = st;
    this._rt = rt;
    this._fee = fee;
    this._v = v;
    this._cf = cf;
    this._al = al;
    this._dt = dt;
    this._h = h;
    this._m = m;
    this._l = l;
    this._cd = cd;
    this._no = no;
    this._ftype = ftype;
    this._djId = djId;
    this._copyright = copyright;
    this._sId = sId;
    this._mark = mark;
    this._mv = mv;
    this._rtype = rtype;
    this._mst = mst;
    this._cp = cp;
    this._publishTime = publishTime;
  }

  String get name => _name;
  set name(String name) => _name = name;
  num get id => _id;
  set id(num id) => _id = id;
  num get pst => _pst;
  set pst(num pst) => _pst = pst;
  num get t => _t;
  set t(num t) => _t = t;
  List<Ar> get ar => _ar;
  set ar(List<Ar> ar) => _ar = ar;
  num get pop => _pop;
  set pop(num pop) => _pop = pop;
  num get st => _st;
  set st(num st) => _st = st;
  String get rt => _rt;
  set rt(String rt) => _rt = rt;
  num get fee => _fee;
  set fee(num fee) => _fee = fee;
  num get v => _v;
  set v(num v) => _v = v;
  String get cf => _cf;
  set cf(String cf) => _cf = cf;
  Al get al => _al;
  set al(Al al) => _al = al;
  num get dt => _dt;
  set dt(num dt) => _dt = dt;
  H get h => _h;
  set h(H h) => _h = h;
  H get m => _m;
  set m(H m) => _m = m;
  H get l => _l;
  set l(H l) => _l = l;
  String get cd => _cd;
  set cd(String cd) => _cd = cd;
  num get no => _no;
  set no(num no) => _no = no;
  num get ftype => _ftype;
  set ftype(num ftype) => _ftype = ftype;
  num get djId => _djId;
  set djId(num djId) => _djId = djId;
  num get copyright => _copyright;
  set copyright(num copyright) => _copyright = copyright;
  num get sId => _sId;
  set sId(num sId) => _sId = sId;
  num get mark => _mark;
  set mark(num mark) => _mark = mark;
  num get mv => _mv;
  set mv(num mv) => _mv = mv;
  num get rtype => _rtype;
  set rtype(num rtype) => _rtype = rtype;
  num get mst => _mst;
  set mst(num mst) => _mst = mst;
  num get cp => _cp;
  set cp(num cp) => _cp = cp;
  num get publishTime => _publishTime;
  set publishTime(num publishTime) => _publishTime = publishTime;

  Tracks.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _id = json['id'];
    _pst = json['pst'];
    _t = json['t'];
    if (json['ar'] != null) {
      _ar = new List<Ar>();
      json['ar'].forEach((v) {
        _ar.add(new Ar.fromJson(v));
      });
    }
    _pop = json['pop'];
    _st = json['st'];
    _rt = json['rt'];
    _fee = json['fee'];
    _v = json['v'];
    _cf = json['cf'];
    _al = json['al'] != null ? new Al.fromJson(json['al']) : null;
    _dt = json['dt'];
    _h = json['h'] != null ? new H.fromJson(json['h']) : null;
    _m = json['m'] != null ? new H.fromJson(json['m']) : null;
    _l = json['l'] != null ? new H.fromJson(json['l']) : null;
    _cd = json['cd'];
    _no = json['no'];
    _ftype = json['ftype'];
    _djId = json['djId'];
    _copyright = json['copyright'];
    _sId = json['s_id'];
    _mark = json['mark'];
    _mv = json['mv'];
    _rtype = json['rtype'];
    _mst = json['mst'];
    _cp = json['cp'];
    _publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['id'] = this._id;
    data['pst'] = this._pst;
    data['t'] = this._t;
    if (this._ar != null) {
      data['ar'] = this._ar.map((v) => v.toJson()).toList();
    }
    data['pop'] = this._pop;
    data['st'] = this._st;
    data['rt'] = this._rt;
    data['fee'] = this._fee;
    data['v'] = this._v;
    data['cf'] = this._cf;
    if (this._al != null) {
      data['al'] = this._al.toJson();
    }
    data['dt'] = this._dt;
    if (this._h != null) {
      data['h'] = this._h.toJson();
    }
    if (this._m != null) {
      data['m'] = this._m.toJson();
    }
    if (this._l != null) {
      data['l'] = this._l.toJson();
    }
    data['cd'] = this._cd;
    data['no'] = this._no;
    data['ftype'] = this._ftype;
    data['djId'] = this._djId;
    data['copyright'] = this._copyright;
    data['s_id'] = this._sId;
    data['mark'] = this._mark;
    data['mv'] = this._mv;
    data['rtype'] = this._rtype;
    data['mst'] = this._mst;
    data['cp'] = this._cp;
    data['publishTime'] = this._publishTime;
    return data;
  }
}

class Ar {
  num _id;
  String _name;

  Ar({num id, String name}) {
    this._id = id;
    this._name = name;
  }

  num get id => _id;
  set id(num id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Ar.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

class Al {
  num _id;
  String _name;
  String _picUrl;
  num _pic;

  Al({num id, String name, String picUrl, num pic}) {
    this._id = id;
    this._name = name;
    this._picUrl = picUrl;
    this._pic = pic;
  }

  num get id => _id;
  set id(num id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  num get pic => _pic;
  set pic(num pic) => _pic = pic;

  Al.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _picUrl = json['picUrl'];
    _pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['picUrl'] = this._picUrl;
    data['pic'] = this._pic;
    return data;
  }
}

class H {
  num _br;
  num _fid;
  num _size;
  num _vd;

  H({num br, num fid, num size, num vd}) {
    this._br = br;
    this._fid = fid;
    this._size = size;
    this._vd = vd;
  }

  num get br => _br;
  set br(num br) => _br = br;
  num get fid => _fid;
  set fid(num fid) => _fid = fid;
  num get size => _size;
  set size(num size) => _size = size;
  num get vd => _vd;
  set vd(num vd) => _vd = vd;

  H.fromJson(Map<String, dynamic> json) {
    _br = json['br'];
    _fid = json['fid'];
    _size = json['size'];
    _vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this._br;
    data['fid'] = this._fid;
    data['size'] = this._size;
    data['vd'] = this._vd;
    return data;
  }
}

class TrackIds {
  num _id;
  num _v;

  TrackIds({num id, num v}) {
    this._id = id;
    this._v = v;
  }

  num get id => _id;
  set id(num id) => _id = id;
  num get v => _v;
  set v(num v) => _v = v;

  TrackIds.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['v'] = this._v;
    return data;
  }
}
