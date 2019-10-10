class MVData {
  int _updateTime;
  List<Data> _data;
  bool _hasMore;
  int _code;

  MVData({int updateTime, List<Data> data, bool hasMore, int code}) {
    this._updateTime = updateTime;
    this._data = data;
    this._hasMore = hasMore;
    this._code = code;
  }

  int get updateTime => _updateTime;
  set updateTime(int updateTime) => _updateTime = updateTime;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;
  bool get hasMore => _hasMore;
  set hasMore(bool hasMore) => _hasMore = hasMore;
  int get code => _code;
  set code(int code) => _code = code;

  MVData.fromJson(Map<String, dynamic> json) {
    _updateTime = json['updateTime'];
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
    _hasMore = json['hasMore'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updateTime'] = this._updateTime;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = this._hasMore;
    data['code'] = this._code;
    return data;
  }
}

class Data {
  int _id;
  String _cover;
  String _name;
  int _playCount;
  String _briefDesc;
  String _desc;
  String _artistName;
  int _artistId;
  int _duration;
  int _mark;
  int _lastRank;
  int _score;
  bool _subed;
  List<Artists> _artists;

  Data(
      {int id,
        String cover,
        String name,
        int playCount,
        String briefDesc,
        String desc,
        String artistName,
        int artistId,
        int duration,
        int mark,
        int lastRank,
        int score,
        bool subed,
        List<Artists> artists}) {
    this._id = id;
    this._cover = cover;
    this._name = name;
    this._playCount = playCount;
    this._briefDesc = briefDesc;
    this._desc = desc;
    this._artistName = artistName;
    this._artistId = artistId;
    this._duration = duration;
    this._mark = mark;
    this._lastRank = lastRank;
    this._score = score;
    this._subed = subed;
    this._artists = artists;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get cover => _cover;
  set cover(String cover) => _cover = cover;
  String get name => _name;
  set name(String name) => _name = name;
  int get playCount => _playCount;
  set playCount(int playCount) => _playCount = playCount;
  String get briefDesc => _briefDesc;
  set briefDesc(String briefDesc) => _briefDesc = briefDesc;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get artistName => _artistName;
  set artistName(String artistName) => _artistName = artistName;
  int get artistId => _artistId;
  set artistId(int artistId) => _artistId = artistId;
  int get duration => _duration;
  set duration(int duration) => _duration = duration;
  int get mark => _mark;
  set mark(int mark) => _mark = mark;
  int get lastRank => _lastRank;
  set lastRank(int lastRank) => _lastRank = lastRank;
  int get score => _score;
  set score(int score) => _score = score;
  bool get subed => _subed;
  set subed(bool subed) => _subed = subed;
  List<Artists> get artists => _artists;
  set artists(List<Artists> artists) => _artists = artists;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _cover = json['cover'];
    _name = json['name'];
    _playCount = json['playCount'];
    _briefDesc = json['briefDesc'];
    _desc = json['desc'];
    _artistName = json['artistName'];
    _artistId = json['artistId'];
    _duration = json['duration'];
    _mark = json['mark'];
    _lastRank = json['lastRank'];
    _score = json['score'];
    _subed = json['subed'];
    if (json['artists'] != null) {
      _artists = new List<Artists>();
      json['artists'].forEach((v) {
        _artists.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['cover'] = this._cover;
    data['name'] = this._name;
    data['playCount'] = this._playCount;
    data['briefDesc'] = this._briefDesc;
    data['desc'] = this._desc;
    data['artistName'] = this._artistName;
    data['artistId'] = this._artistId;
    data['duration'] = this._duration;
    data['mark'] = this._mark;
    data['lastRank'] = this._lastRank;
    data['score'] = this._score;
    data['subed'] = this._subed;
    if (this._artists != null) {
      data['artists'] = this._artists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  int _id;
  String _name;

  Artists({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Artists.fromJson(Map<String, dynamic> json) {
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
