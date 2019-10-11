import 'package:netease_cloud_music/model/play_list.dart';

class SongDetailData {
  List<Songs> _songs;
  List<Privileges> _privileges;
  num _code;
  Playlist _playlist;

  SongDetailData({List<Songs> songs, List<Privileges> privileges, num code, Playlist playlist}) {
    this._songs = songs;
    this._privileges = privileges;
    this._code = code;
    this._playlist = playlist;
  }


  Playlist get playlist => _playlist;

  set playlist(Playlist value) {
    _playlist = value;
  }

  List<Songs> get songs => _songs;

  set songs(List<Songs> songs) => _songs = songs;

  List<Privileges> get privileges => _privileges;

  set privileges(List<Privileges> privileges) => _privileges = privileges;

  num get code => _code;

  set code(num code) => _code = code;

  SongDetailData.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      _songs = new List<Songs>();
      json['songs'].forEach((v) {
        _songs.add(new Songs.fromJson(v));
      });
    }
    if (json['privileges'] != null) {
      _privileges = new List<Privileges>();
      json['privileges'].forEach((v) {
        _privileges.add(new Privileges.fromJson(v));
      });
    }
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._songs != null) {
      data['songs'] = this._songs.map((v) => v.toJson()).toList();
    }
    if (this._privileges != null) {
      data['privileges'] = this._privileges.map((v) => v.toJson()).toList();
    }
    data['code'] = this._code;
    return data;
  }
}

class Songs {
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
  num _rtype;
  Null _rurl;
  num _mst;
  num _cp;
  num _mv;
  num _publishTime;

  Songs(
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
      num rtype,
      Null rurl,
      num mst,
      num cp,
      num mv,
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
    this._rtype = rtype;
    this._rurl = rurl;
    this._mst = mst;
    this._cp = cp;
    this._mv = mv;
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

  num get rtype => _rtype;

  set rtype(num rtype) => _rtype = rtype;

  Null get rurl => _rurl;

  set rurl(Null rurl) => _rurl = rurl;

  num get mst => _mst;

  set mst(num mst) => _mst = mst;

  num get cp => _cp;

  set cp(num cp) => _cp = cp;

  num get mv => _mv;

  set mv(num mv) => _mv = mv;

  num get publishTime => _publishTime;

  set publishTime(num publishTime) => _publishTime = publishTime;

  Songs.fromJson(Map<String, dynamic> json) {
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
    _rtype = json['rtype'];
    _rurl = json['rurl'];
    _mst = json['mst'];
    _cp = json['cp'];
    _mv = json['mv'];
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
    data['rtype'] = this._rtype;
    data['rurl'] = this._rurl;
    data['mst'] = this._mst;
    data['cp'] = this._cp;
    data['mv'] = this._mv;
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

class Privileges {
  num _id;
  num _fee;
  num _payed;
  num _st;
  num _pl;
  num _dl;
  num _sp;
  num _cp;
  num _subp;
  bool _cs;
  num _maxbr;
  num _fl;
  bool _toast;
  num _flag;
  bool _preSell;

  Privileges(
      {num id,
      num fee,
      num payed,
      num st,
      num pl,
      num dl,
      num sp,
      num cp,
      num subp,
      bool cs,
      num maxbr,
      num fl,
      bool toast,
      num flag,
      bool preSell}) {
    this._id = id;
    this._fee = fee;
    this._payed = payed;
    this._st = st;
    this._pl = pl;
    this._dl = dl;
    this._sp = sp;
    this._cp = cp;
    this._subp = subp;
    this._cs = cs;
    this._maxbr = maxbr;
    this._fl = fl;
    this._toast = toast;
    this._flag = flag;
    this._preSell = preSell;
  }

  num get id => _id;

  set id(num id) => _id = id;

  num get fee => _fee;

  set fee(num fee) => _fee = fee;

  num get payed => _payed;

  set payed(num payed) => _payed = payed;

  num get st => _st;

  set st(num st) => _st = st;

  num get pl => _pl;

  set pl(num pl) => _pl = pl;

  num get dl => _dl;

  set dl(num dl) => _dl = dl;

  num get sp => _sp;

  set sp(num sp) => _sp = sp;

  num get cp => _cp;

  set cp(num cp) => _cp = cp;

  num get subp => _subp;

  set subp(num subp) => _subp = subp;

  bool get cs => _cs;

  set cs(bool cs) => _cs = cs;

  num get maxbr => _maxbr;

  set maxbr(num maxbr) => _maxbr = maxbr;

  num get fl => _fl;

  set fl(num fl) => _fl = fl;

  bool get toast => _toast;

  set toast(bool toast) => _toast = toast;

  num get flag => _flag;

  set flag(num flag) => _flag = flag;

  bool get preSell => _preSell;

  set preSell(bool preSell) => _preSell = preSell;

  Privileges.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fee = json['fee'];
    _payed = json['payed'];
    _st = json['st'];
    _pl = json['pl'];
    _dl = json['dl'];
    _sp = json['sp'];
    _cp = json['cp'];
    _subp = json['subp'];
    _cs = json['cs'];
    _maxbr = json['maxbr'];
    _fl = json['fl'];
    _toast = json['toast'];
    _flag = json['flag'];
    _preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['fee'] = this._fee;
    data['payed'] = this._payed;
    data['st'] = this._st;
    data['pl'] = this._pl;
    data['dl'] = this._dl;
    data['sp'] = this._sp;
    data['cp'] = this._cp;
    data['subp'] = this._subp;
    data['cs'] = this._cs;
    data['maxbr'] = this._maxbr;
    data['fl'] = this._fl;
    data['toast'] = this._toast;
    data['flag'] = this._flag;
    data['preSell'] = this._preSell;
    return data;
  }
}
