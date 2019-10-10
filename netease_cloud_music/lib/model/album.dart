class AlbumData {
  int _total;
  List<Albums> _albums;
  int _code;

  AlbumData({int total, List<Albums> albums, int code}) {
    this._total = total;
    this._albums = albums;
    this._code = code;
  }

  int get total => _total;
  set total(int total) => _total = total;
  List<Albums> get albums => _albums;
  set albums(List<Albums> albums) => _albums = albums;
  int get code => _code;
  set code(int code) => _code = code;

  AlbumData.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    if (json['albums'] != null) {
      _albums = new List<Albums>();
      json['albums'].forEach((v) {
        _albums.add(new Albums.fromJson(v));
      });
    }
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this._total;
    if (this._albums != null) {
      data['albums'] = this._albums.map((v) => v.toJson()).toList();
    }
    data['code'] = this._code;
    return data;
  }
}

class Albums {
  bool _paid;
  bool _onSale;
  int _mark;
  List<Artists> _artists;
  int _copyrightId;
  Artist _artist;
  int _picId;
  int _publishTime;
  String _commentThreadId;
  String _briefDesc;
  String _picUrl;
  String _company;
  String _blurPicUrl;
  int _companyId;
  int _pic;
  String _tags;
  int _status;
  String _subType;
  String _description;
  String _name;
  int _id;
  String _type;
  int _size;
  String _picIdStr;

  Albums(
      {
        bool paid,
        bool onSale,
        int mark,
        List<Artists> artists,
        int copyrightId,
        Artist artist,
        int picId,
        int publishTime,
        String commentThreadId,
        String briefDesc,
        String picUrl,
        String company,
        String blurPicUrl,
        int companyId,
        int pic,
        String tags,
        int status,
        String subType,
        String description,
        String name,
        int id,
        String type,
        int size,
        String picIdStr}) {
    this._paid = paid;
    this._onSale = onSale;
    this._mark = mark;
    this._artists = artists;
    this._copyrightId = copyrightId;
    this._artist = artist;
    this._picId = picId;
    this._publishTime = publishTime;
    this._commentThreadId = commentThreadId;
    this._briefDesc = briefDesc;
    this._picUrl = picUrl;
    this._company = company;
    this._blurPicUrl = blurPicUrl;
    this._companyId = companyId;
    this._pic = pic;
    this._tags = tags;
    this._status = status;
    this._subType = subType;
    this._description = description;
    this._name = name;
    this._id = id;
    this._type = type;
    this._size = size;
    this._picIdStr = picIdStr;
  }

  bool get paid => _paid;
  set paid(bool paid) => _paid = paid;
  bool get onSale => _onSale;
  set onSale(bool onSale) => _onSale = onSale;
  int get mark => _mark;
  set mark(int mark) => _mark = mark;
  List<Artists> get artists => _artists;
  set artists(List<Artists> artists) => _artists = artists;
  int get copyrightId => _copyrightId;
  set copyrightId(int copyrightId) => _copyrightId = copyrightId;
  Artist get artist => _artist;
  set artist(Artist artist) => _artist = artist;
  int get picId => _picId;
  set picId(int picId) => _picId = picId;
  int get publishTime => _publishTime;
  set publishTime(int publishTime) => _publishTime = publishTime;
  String get commentThreadId => _commentThreadId;
  set commentThreadId(String commentThreadId) =>
      _commentThreadId = commentThreadId;
  String get briefDesc => _briefDesc;
  set briefDesc(String briefDesc) => _briefDesc = briefDesc;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  String get company => _company;
  set company(String company) => _company = company;
  String get blurPicUrl => _blurPicUrl;
  set blurPicUrl(String blurPicUrl) => _blurPicUrl = blurPicUrl;
  int get companyId => _companyId;
  set companyId(int companyId) => _companyId = companyId;
  int get pic => _pic;
  set pic(int pic) => _pic = pic;
  String get tags => _tags;
  set tags(String tags) => _tags = tags;
  int get status => _status;
  set status(int status) => _status = status;
  String get subType => _subType;
  set subType(String subType) => _subType = subType;
  String get description => _description;
  set description(String description) => _description = description;
  String get name => _name;
  set name(String name) => _name = name;
  int get id => _id;
  set id(int id) => _id = id;
  String get type => _type;
  set type(String type) => _type = type;
  int get size => _size;
  set size(int size) => _size = size;
  String get picIdStr => _picIdStr;
  set picIdStr(String picIdStr) => _picIdStr = picIdStr;

  Albums.fromJson(Map<String, dynamic> json) {

    _paid = json['paid'];
    _onSale = json['onSale'];
    _mark = json['mark'];
    if (json['artists'] != null) {
      _artists = new List<Artists>();
      json['artists'].forEach((v) {
        _artists.add(new Artists.fromJson(v));
      });
    }
    _copyrightId = json['copyrightId'];
    _artist =
    json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    _picId = json['picId'];
    _publishTime = json['publishTime'];
    _commentThreadId = json['commentThreadId'];
    _briefDesc = json['briefDesc'];
    _picUrl = json['picUrl'];
    _company = json['company'];
    _blurPicUrl = json['blurPicUrl'];
    _companyId = json['companyId'];
    _pic = json['pic'];
    _tags = json['tags'];
    _status = json['status'];
    _subType = json['subType'];
    _description = json['description'];
    _name = json['name'];
    _id = json['id'];
    _type = json['type'];
    _size = json['size'];
    _picIdStr = json['picId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paid'] = this._paid;
    data['onSale'] = this._onSale;
    data['mark'] = this._mark;
    if (this._artists != null) {
      data['artists'] = this._artists.map((v) => v.toJson()).toList();
    }
    data['copyrightId'] = this._copyrightId;
    if (this._artist != null) {
      data['artist'] = this._artist.toJson();
    }
    data['picId'] = this._picId;
    data['publishTime'] = this._publishTime;
    data['commentThreadId'] = this._commentThreadId;
    data['briefDesc'] = this._briefDesc;
    data['picUrl'] = this._picUrl;
    data['company'] = this._company;
    data['blurPicUrl'] = this._blurPicUrl;
    data['companyId'] = this._companyId;
    data['pic'] = this._pic;
    data['tags'] = this._tags;
    data['status'] = this._status;
    data['subType'] = this._subType;
    data['description'] = this._description;
    data['name'] = this._name;
    data['id'] = this._id;
    data['type'] = this._type;
    data['size'] = this._size;
    data['picId_str'] = this._picIdStr;
    return data;
  }
}

class Artists {
  int _img1v1Id;
  int _topicPerson;
  int _picId;
  int _albumSize;
  int _musicSize;
  String _briefDesc;
  bool _followed;
  String _img1v1Url;
  String _trans;
  String _picUrl;
  String _name;
  int _id;
  String _img1v1IdStr;

  Artists(
      {int img1v1Id,
        int topicPerson,
        int picId,
        int albumSize,
        int musicSize,
        String briefDesc,
        bool followed,
        String img1v1Url,
        String trans,
        String picUrl,
        String name,
        int id,
        String img1v1IdStr}) {
    this._img1v1Id = img1v1Id;
    this._topicPerson = topicPerson;
    this._picId = picId;
    this._albumSize = albumSize;
    this._musicSize = musicSize;
    this._briefDesc = briefDesc;
    this._followed = followed;
    this._img1v1Url = img1v1Url;
    this._trans = trans;
    this._picUrl = picUrl;
    this._name = name;
    this._id = id;
    this._img1v1IdStr = img1v1IdStr;
  }

  int get img1v1Id => _img1v1Id;
  set img1v1Id(int img1v1Id) => _img1v1Id = img1v1Id;
  int get topicPerson => _topicPerson;
  set topicPerson(int topicPerson) => _topicPerson = topicPerson;
  int get picId => _picId;
  set picId(int picId) => _picId = picId;
  int get albumSize => _albumSize;
  set albumSize(int albumSize) => _albumSize = albumSize;
  int get musicSize => _musicSize;
  set musicSize(int musicSize) => _musicSize = musicSize;
  String get briefDesc => _briefDesc;
  set briefDesc(String briefDesc) => _briefDesc = briefDesc;
  bool get followed => _followed;
  set followed(bool followed) => _followed = followed;
  String get img1v1Url => _img1v1Url;
  set img1v1Url(String img1v1Url) => _img1v1Url = img1v1Url;
  String get trans => _trans;
  set trans(String trans) => _trans = trans;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  String get name => _name;
  set name(String name) => _name = name;
  int get id => _id;
  set id(int id) => _id = id;
  String get img1v1IdStr => _img1v1IdStr;
  set img1v1IdStr(String img1v1IdStr) => _img1v1IdStr = img1v1IdStr;

  Artists.fromJson(Map<String, dynamic> json) {
    _img1v1Id = json['img1v1Id'];
    _topicPerson = json['topicPerson'];
    _picId = json['picId'];
    _albumSize = json['albumSize'];
    _musicSize = json['musicSize'];
    _briefDesc = json['briefDesc'];
    _followed = json['followed'];
    _img1v1Url = json['img1v1Url'];
    _trans = json['trans'];
    _picUrl = json['picUrl'];
    _name = json['name'];
    _id = json['id'];
    _img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this._img1v1Id;
    data['topicPerson'] = this._topicPerson;
    data['picId'] = this._picId;
    data['albumSize'] = this._albumSize;
    data['musicSize'] = this._musicSize;
    data['briefDesc'] = this._briefDesc;
    data['followed'] = this._followed;
    data['img1v1Url'] = this._img1v1Url;
    data['trans'] = this._trans;
    data['picUrl'] = this._picUrl;
    data['name'] = this._name;
    data['id'] = this._id;
    data['img1v1Id_str'] = this._img1v1IdStr;
    return data;
  }
}

class Artist {
  int _img1v1Id;
  int _topicPerson;
  int _picId;
  int _albumSize;
  int _musicSize;
  String _briefDesc;
  bool _followed;
  String _img1v1Url;
  String _trans;
  String _picUrl;
  String _name;
  int _id;
  List<String> _transNames;
  String _img1v1IdStr;

  Artist(
      {int img1v1Id,
        int topicPerson,
        int picId,
        int albumSize,
        int musicSize,
        String briefDesc,
        bool followed,
        String img1v1Url,
        String trans,
        String picUrl,
        String name,
        int id,
        List<String> transNames,
        String img1v1IdStr}) {
    this._img1v1Id = img1v1Id;
    this._topicPerson = topicPerson;
    this._picId = picId;
    this._albumSize = albumSize;
    this._musicSize = musicSize;
    this._briefDesc = briefDesc;
    this._followed = followed;
    this._img1v1Url = img1v1Url;
    this._trans = trans;
    this._picUrl = picUrl;
    this._name = name;
    this._id = id;
    this._transNames = transNames;
    this._img1v1IdStr = img1v1IdStr;
  }

  int get img1v1Id => _img1v1Id;
  set img1v1Id(int img1v1Id) => _img1v1Id = img1v1Id;
  int get topicPerson => _topicPerson;
  set topicPerson(int topicPerson) => _topicPerson = topicPerson;
  int get picId => _picId;
  set picId(int picId) => _picId = picId;
  int get albumSize => _albumSize;
  set albumSize(int albumSize) => _albumSize = albumSize;
  int get musicSize => _musicSize;
  set musicSize(int musicSize) => _musicSize = musicSize;
  String get briefDesc => _briefDesc;
  set briefDesc(String briefDesc) => _briefDesc = briefDesc;
  bool get followed => _followed;
  set followed(bool followed) => _followed = followed;
  String get img1v1Url => _img1v1Url;
  set img1v1Url(String img1v1Url) => _img1v1Url = img1v1Url;
  String get trans => _trans;
  set trans(String trans) => _trans = trans;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  String get name => _name;
  set name(String name) => _name = name;
  int get id => _id;
  set id(int id) => _id = id;
  List<String> get transNames => _transNames;
  set transNames(List<String> transNames) => _transNames = transNames;
  String get img1v1IdStr => _img1v1IdStr;
  set img1v1IdStr(String img1v1IdStr) => _img1v1IdStr = img1v1IdStr;

  Artist.fromJson(Map<String, dynamic> json) {
    _img1v1Id = json['img1v1Id'];
    _topicPerson = json['topicPerson'];
    _picId = json['picId'];
    _albumSize = json['albumSize'];
    _musicSize = json['musicSize'];
    _briefDesc = json['briefDesc'];
    _followed = json['followed'];
    _img1v1Url = json['img1v1Url'];
    _trans = json['trans'];
    _picUrl = json['picUrl'];
    _name = json['name'];
    _id = json['id'];
    _transNames = json['transNames'] == null ? List() : json['transNames'].cast<String>();
    _img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this._img1v1Id;
    data['topicPerson'] = this._topicPerson;
    data['picId'] = this._picId;
    data['albumSize'] = this._albumSize;
    data['musicSize'] = this._musicSize;
    data['briefDesc'] = this._briefDesc;
    data['followed'] = this._followed;
    data['img1v1Url'] = this._img1v1Url;
    data['trans'] = this._trans;
    data['picUrl'] = this._picUrl;
    data['name'] = this._name;
    data['id'] = this._id;
    data['transNames'] = this._transNames;
    data['img1v1Id_str'] = this._img1v1IdStr;
    return data;
  }
}
