class Banner {
  List<Banners> _banners;
  int _code;

  Banner({List<Banners> banners, int code}) {
    this._banners = banners;
    this._code = code;
  }

  List<Banners> get banners => _banners;
  set banners(List<Banners> banners) => _banners = banners;
  int get code => _code;
  set code(int code) => _code = code;

  Banner.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      _banners = new List<Banners>();
      json['banners'].forEach((v) {
        _banners.add(new Banners.fromJson(v));
      });
    }
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._banners != null) {
      data['banners'] = this._banners.map((v) => v.toJson()).toList();
    }
    data['code'] = this._code;
    return data;
  }
}

class Banners {
  String _pic;
  String _typeTitle;
  int _targetId;

  Banners({String pic, String typeTitle, int targetId}) {
    this._pic = pic;
    this._typeTitle = typeTitle;
    this._targetId = targetId;
  }

  String get pic => _pic;
  set pic(String pic) => _pic = pic;
  String get typeTitle => _typeTitle;
  set typeTitle(String typeTitle) => _typeTitle = typeTitle;
  int get targetId => _targetId;
  set targetId(int targetId) => _targetId = targetId;

  Banners.fromJson(Map<String, dynamic> json) {
    _pic = json['pic'];
    _typeTitle = json['typeTitle'];
    _targetId = json['targetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this._pic;
    data['typeTitle'] = this._typeTitle;
    data['targetId'] = this._targetId;
    return data;
  }
}
