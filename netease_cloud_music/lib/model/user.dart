class User {
  int _loginType;
  int _code;
  String _msg;
  Account _account;
  Profile _profile;
  List<Bindings> _bindings;

  User(
      {int loginType,
      int code,
        String msg,
      Account account,
      Profile profile,
      List<Bindings> bindings}) {
    this._loginType = loginType;
    this._code = code;
    this._msg = msg;
    this._account = account;
    this._profile = profile;
    this._bindings = bindings;
  }

  int get loginType => _loginType;

  set loginType(int loginType) => _loginType = loginType;

  int get code => _code;

  set code(int code) => _code = code;


  String get msg => _msg;

  set msg(String value) {
    _msg = value;
  }

  Account get account => _account;

  set account(Account account) => _account = account;

  Profile get profile => _profile;

  set profile(Profile profile) => _profile = profile;

  List<Bindings> get bindings => _bindings;

  set bindings(List<Bindings> bindings) => _bindings = bindings;

  User.fromJson(Map<String, dynamic> json) {
    _loginType = json['loginType'];
    _code = json['code'];
    _msg = json['msg'];
    _account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    _profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['bindings'] != null) {
      _bindings = new List<Bindings>();
      json['bindings'].forEach((v) {
        _bindings.add(new Bindings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this._loginType;
    data['code'] = this._code;
    if (this._account != null) {
      data['account'] = this._account.toJson();
    }
    if (this._profile != null) {
      data['profile'] = this._profile.toJson();
    }
    if (this._bindings != null) {
      data['bindings'] = this._bindings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Account {
  int _id;
  String _userName;
  int _type;
  int _status;
  int _whitelistAuthority;
  int _createTime;
  String _salt;
  int _tokenVersion;
  int _ban;
  int _baoyueVersion;
  int _donateVersion;
  int _vipType;
  int _viptypeVersion;
  bool _anonimousUser;

  Account(
      {int id,
      String userName,
      int type,
      int status,
      int whitelistAuthority,
      int createTime,
      String salt,
      int tokenVersion,
      int ban,
      int baoyueVersion,
      int donateVersion,
      int vipType,
      int viptypeVersion,
      bool anonimousUser}) {
    this._id = id;
    this._userName = userName;
    this._type = type;
    this._status = status;
    this._whitelistAuthority = whitelistAuthority;
    this._createTime = createTime;
    this._salt = salt;
    this._tokenVersion = tokenVersion;
    this._ban = ban;
    this._baoyueVersion = baoyueVersion;
    this._donateVersion = donateVersion;
    this._vipType = vipType;
    this._viptypeVersion = viptypeVersion;
    this._anonimousUser = anonimousUser;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get userName => _userName;

  set userName(String userName) => _userName = userName;

  int get type => _type;

  set type(int type) => _type = type;

  int get status => _status;

  set status(int status) => _status = status;

  int get whitelistAuthority => _whitelistAuthority;

  set whitelistAuthority(int whitelistAuthority) =>
      _whitelistAuthority = whitelistAuthority;

  int get createTime => _createTime;

  set createTime(int createTime) => _createTime = createTime;

  String get salt => _salt;

  set salt(String salt) => _salt = salt;

  int get tokenVersion => _tokenVersion;

  set tokenVersion(int tokenVersion) => _tokenVersion = tokenVersion;

  int get ban => _ban;

  set ban(int ban) => _ban = ban;

  int get baoyueVersion => _baoyueVersion;

  set baoyueVersion(int baoyueVersion) => _baoyueVersion = baoyueVersion;

  int get donateVersion => _donateVersion;

  set donateVersion(int donateVersion) => _donateVersion = donateVersion;

  int get vipType => _vipType;

  set vipType(int vipType) => _vipType = vipType;

  int get viptypeVersion => _viptypeVersion;

  set viptypeVersion(int viptypeVersion) => _viptypeVersion = viptypeVersion;

  bool get anonimousUser => _anonimousUser;

  set anonimousUser(bool anonimousUser) => _anonimousUser = anonimousUser;

  Account.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userName = json['userName'];
    _type = json['type'];
    _status = json['status'];
    _whitelistAuthority = json['whitelistAuthority'];
    _createTime = json['createTime'];
    _salt = json['salt'];
    _tokenVersion = json['tokenVersion'];
    _ban = json['ban'];
    _baoyueVersion = json['baoyueVersion'];
    _donateVersion = json['donateVersion'];
    _vipType = json['vipType'];
    _viptypeVersion = json['viptypeVersion'];
    _anonimousUser = json['anonimousUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['userName'] = this._userName;
    data['type'] = this._type;
    data['status'] = this._status;
    data['whitelistAuthority'] = this._whitelistAuthority;
    data['createTime'] = this._createTime;
    data['salt'] = this._salt;
    data['tokenVersion'] = this._tokenVersion;
    data['ban'] = this._ban;
    data['baoyueVersion'] = this._baoyueVersion;
    data['donateVersion'] = this._donateVersion;
    data['vipType'] = this._vipType;
    data['viptypeVersion'] = this._viptypeVersion;
    data['anonimousUser'] = this._anonimousUser;
    return data;
  }
}

class Profile {
  int _gender;
  int _accountStatus;
  int _userId;
  int _vipType;
  bool _defaultAvatar;
  String _avatarUrl;
  String _nickname;
  int _birthday;
  int _avatarImgId;
  int _city;
  int _userType;
  int _backgroundImgId;
  int _province;
  int _djStatus;
  Experts _experts;
  bool _mutual;
  Null _remarkName;
  Null _expertTags;
  int _authStatus;
  bool _followed;
  String _detailDescription;
  String _backgroundUrl;
  String _description;
  String _avatarImgIdStr;
  String _backgroundImgIdStr;
  String _signature;
  int _authority;
  int _followeds;
  int _follows;
  int _eventCount;
  int _playlistCount;
  int _playlistBeSubscribedCount;

  Profile(
      {int gender,
      int accountStatus,
      int userId,
      int vipType,
      bool defaultAvatar,
      String avatarUrl,
      String nickname,
      int birthday,
      int avatarImgId,
      int city,
      int userType,
      int backgroundImgId,
      int province,
      int djStatus,
      Experts experts,
      bool mutual,
      Null remarkName,
      Null expertTags,
      int authStatus,
      bool followed,
      String detailDescription,
      String backgroundUrl,
      String description,
      String avatarImgIdStr,
      String backgroundImgIdStr,
      String signature,
      int authority,
      int followeds,
      int follows,
      int eventCount,
      int playlistCount,
      int playlistBeSubscribedCount}) {
    this._gender = gender;
    this._accountStatus = accountStatus;
    this._userId = userId;
    this._vipType = vipType;
    this._defaultAvatar = defaultAvatar;
    this._avatarUrl = avatarUrl;
    this._nickname = nickname;
    this._birthday = birthday;
    this._avatarImgId = avatarImgId;
    this._city = city;
    this._userType = userType;
    this._backgroundImgId = backgroundImgId;
    this._province = province;
    this._djStatus = djStatus;
    this._experts = experts;
    this._mutual = mutual;
    this._remarkName = remarkName;
    this._expertTags = expertTags;
    this._authStatus = authStatus;
    this._followed = followed;
    this._detailDescription = detailDescription;
    this._backgroundUrl = backgroundUrl;
    this._description = description;
    this._avatarImgIdStr = avatarImgIdStr;
    this._backgroundImgIdStr = backgroundImgIdStr;
    this._signature = signature;
    this._authority = authority;
    this._followeds = followeds;
    this._follows = follows;
    this._eventCount = eventCount;
    this._playlistCount = playlistCount;
    this._playlistBeSubscribedCount = playlistBeSubscribedCount;
  }

  int get gender => _gender;

  set gender(int gender) => _gender = gender;

  int get accountStatus => _accountStatus;

  set accountStatus(int accountStatus) => _accountStatus = accountStatus;

  int get userId => _userId;

  set userId(int userId) => _userId = userId;

  int get vipType => _vipType;

  set vipType(int vipType) => _vipType = vipType;

  bool get defaultAvatar => _defaultAvatar;

  set defaultAvatar(bool defaultAvatar) => _defaultAvatar = defaultAvatar;

  String get avatarUrl => _avatarUrl;

  set avatarUrl(String avatarUrl) => _avatarUrl = avatarUrl;

  String get nickname => _nickname;

  set nickname(String nickname) => _nickname = nickname;

  int get birthday => _birthday;

  set birthday(int birthday) => _birthday = birthday;

  int get avatarImgId => _avatarImgId;

  set avatarImgId(int avatarImgId) => _avatarImgId = avatarImgId;

  int get city => _city;

  set city(int city) => _city = city;

  int get userType => _userType;

  set userType(int userType) => _userType = userType;

  int get backgroundImgId => _backgroundImgId;

  set backgroundImgId(int backgroundImgId) =>
      _backgroundImgId = backgroundImgId;

  int get province => _province;

  set province(int province) => _province = province;

  int get djStatus => _djStatus;

  set djStatus(int djStatus) => _djStatus = djStatus;

  Experts get experts => _experts;

  set experts(Experts experts) => _experts = experts;

  bool get mutual => _mutual;

  set mutual(bool mutual) => _mutual = mutual;

  Null get remarkName => _remarkName;

  set remarkName(Null remarkName) => _remarkName = remarkName;

  Null get expertTags => _expertTags;

  set expertTags(Null expertTags) => _expertTags = expertTags;

  int get authStatus => _authStatus;

  set authStatus(int authStatus) => _authStatus = authStatus;

  bool get followed => _followed;

  set followed(bool followed) => _followed = followed;

  String get detailDescription => _detailDescription;

  set detailDescription(String detailDescription) =>
      _detailDescription = detailDescription;

  String get backgroundUrl => _backgroundUrl;

  set backgroundUrl(String backgroundUrl) => _backgroundUrl = backgroundUrl;

  String get description => _description;

  set description(String description) => _description = description;

  String get avatarImgIdStr => _avatarImgIdStr;

  set avatarImgIdStr(String avatarImgIdStr) => _avatarImgIdStr = avatarImgIdStr;

  String get backgroundImgIdStr => _backgroundImgIdStr;

  set backgroundImgIdStr(String backgroundImgIdStr) =>
      _backgroundImgIdStr = backgroundImgIdStr;

  String get signature => _signature;

  set signature(String signature) => _signature = signature;

  int get authority => _authority;

  set authority(int authority) => _authority = authority;

  int get followeds => _followeds;

  set followeds(int followeds) => _followeds = followeds;

  int get follows => _follows;

  set follows(int follows) => _follows = follows;

  int get eventCount => _eventCount;

  set eventCount(int eventCount) => _eventCount = eventCount;

  int get playlistCount => _playlistCount;

  set playlistCount(int playlistCount) => _playlistCount = playlistCount;

  int get playlistBeSubscribedCount => _playlistBeSubscribedCount;

  set playlistBeSubscribedCount(int playlistBeSubscribedCount) =>
      _playlistBeSubscribedCount = playlistBeSubscribedCount;

  Profile.fromJson(Map<String, dynamic> json) {
    _gender = json['gender'];
    _accountStatus = json['accountStatus'];
    _userId = json['userId'];
    _vipType = json['vipType'];
    _defaultAvatar = json['defaultAvatar'];
    _avatarUrl = json['avatarUrl'];
    _nickname = json['nickname'];
    _birthday = json['birthday'];
    _avatarImgId = json['avatarImgId'];
    _city = json['city'];
    _userType = json['userType'];
    _backgroundImgId = json['backgroundImgId'];
    _province = json['province'];
    _djStatus = json['djStatus'];
    _experts =
        json['experts'] != null ? new Experts.fromJson(json['experts']) : null;
    _mutual = json['mutual'];
    _remarkName = json['remarkName'];
    _expertTags = json['expertTags'];
    _authStatus = json['authStatus'];
    _followed = json['followed'];
    _detailDescription = json['detailDescription'];
    _backgroundUrl = json['backgroundUrl'];
    _description = json['description'];
    _avatarImgIdStr = json['avatarImgIdStr'];
    _backgroundImgIdStr = json['backgroundImgIdStr'];
    _signature = json['signature'];
    _authority = json['authority'];
    _followeds = json['followeds'];
    _follows = json['follows'];
    _eventCount = json['eventCount'];
    _playlistCount = json['playlistCount'];
    _playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this._gender;
    data['accountStatus'] = this._accountStatus;
    data['userId'] = this._userId;
    data['vipType'] = this._vipType;
    data['defaultAvatar'] = this._defaultAvatar;
    data['avatarUrl'] = this._avatarUrl;
    data['nickname'] = this._nickname;
    data['birthday'] = this._birthday;
    data['avatarImgId'] = this._avatarImgId;
    data['city'] = this._city;
    data['userType'] = this._userType;
    data['backgroundImgId'] = this._backgroundImgId;
    data['province'] = this._province;
    data['djStatus'] = this._djStatus;
    if (this._experts != null) {
      data['experts'] = this._experts.toJson();
    }
    data['mutual'] = this._mutual;
    data['remarkName'] = this._remarkName;
    data['expertTags'] = this._expertTags;
    data['authStatus'] = this._authStatus;
    data['followed'] = this._followed;
    data['detailDescription'] = this._detailDescription;
    data['backgroundUrl'] = this._backgroundUrl;
    data['description'] = this._description;
    data['avatarImgIdStr'] = this._avatarImgIdStr;
    data['backgroundImgIdStr'] = this._backgroundImgIdStr;
    data['signature'] = this._signature;
    data['authority'] = this._authority;
    data['followeds'] = this._followeds;
    data['follows'] = this._follows;
    data['eventCount'] = this._eventCount;
    data['playlistCount'] = this._playlistCount;
    data['playlistBeSubscribedCount'] = this._playlistBeSubscribedCount;
    return data;
  }
}

class Experts {
  Experts() {}

  Experts.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Bindings {
  String _url;
  int _userId;
  String _tokenJsonStr;
  int _bindingTime;
  int _refreshTime;
  int _expiresIn;
  bool _expired;
  int _id;
  int _type;

  Bindings(
      {String url,
      int userId,
      String tokenJsonStr,
      int bindingTime,
      int refreshTime,
      int expiresIn,
      bool expired,
      int id,
      int type}) {
    this._url = url;
    this._userId = userId;
    this._tokenJsonStr = tokenJsonStr;
    this._bindingTime = bindingTime;
    this._refreshTime = refreshTime;
    this._expiresIn = expiresIn;
    this._expired = expired;
    this._id = id;
    this._type = type;
  }

  String get url => _url;

  set url(String url) => _url = url;

  int get userId => _userId;

  set userId(int userId) => _userId = userId;

  String get tokenJsonStr => _tokenJsonStr;

  set tokenJsonStr(String tokenJsonStr) => _tokenJsonStr = tokenJsonStr;

  int get bindingTime => _bindingTime;

  set bindingTime(int bindingTime) => _bindingTime = bindingTime;

  int get refreshTime => _refreshTime;

  set refreshTime(int refreshTime) => _refreshTime = refreshTime;

  int get expiresIn => _expiresIn;

  set expiresIn(int expiresIn) => _expiresIn = expiresIn;

  bool get expired => _expired;

  set expired(bool expired) => _expired = expired;

  int get id => _id;

  set id(int id) => _id = id;

  int get type => _type;

  set type(int type) => _type = type;

  Bindings.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _userId = json['userId'];
    _tokenJsonStr = json['tokenJsonStr'];
    _bindingTime = json['bindingTime'];
    _refreshTime = json['refreshTime'];
    _expiresIn = json['expiresIn'];
    _expired = json['expired'];
    _id = json['id'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    data['userId'] = this._userId;
    data['tokenJsonStr'] = this._tokenJsonStr;
    data['bindingTime'] = this._bindingTime;
    data['refreshTime'] = this._refreshTime;
    data['expiresIn'] = this._expiresIn;
    data['expired'] = this._expired;
    data['id'] = this._id;
    data['type'] = this._type;
    return data;
  }
}
