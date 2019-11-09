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

class HotSearchData {
  int code;
  List<Data> data;
  String message;

  HotSearchData({
    this.code,
    this.data,
    this.message,
  });

  factory HotSearchData.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Data> data = jsonRes['data'] is List ? [] : null;
    if (data != null) {
      for (var item in jsonRes['data']) {
        if (item != null) {
          data.add(Data.fromJson(item));
        }
      }
    }
    return HotSearchData(
      code:
          convertValueByType(jsonRes['code'], int, stack: "HotSearchData-code"),
      data: data,
      message: convertValueByType(jsonRes['message'], String,
          stack: "HotSearchData-message"),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'data': data,
        'message': message,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Data {
  String searchWord;
  int score;
  String content;
  int source;
  int iconType;
  String iconUrl;
  String url;
  String alg;

  Data({
    this.searchWord,
    this.score,
    this.content,
    this.source,
    this.iconType,
    this.iconUrl,
    this.url,
    this.alg,
  });

  factory Data.fromJson(jsonRes) => jsonRes == null
      ? null
      : Data(
          searchWord: convertValueByType(jsonRes['searchWord'], String,
              stack: "Data-searchWord"),
          score: convertValueByType(jsonRes['score'], int, stack: "Data-score"),
          content: convertValueByType(jsonRes['content'], String,
              stack: "Data-content"),
          source:
              convertValueByType(jsonRes['source'], int, stack: "Data-source"),
          iconType: convertValueByType(jsonRes['iconType'], int,
              stack: "Data-iconType"),
          iconUrl: convertValueByType(jsonRes['iconUrl'], String,
              stack: "Data-iconUrl"),
          url: convertValueByType(jsonRes['url'], String, stack: "Data-url"),
          alg: convertValueByType(jsonRes['alg'], String, stack: "Data-alg"),
        );

  Map<String, dynamic> toJson() => {
        'searchWord': searchWord,
        'score': score,
        'content': content,
        'source': source,
        'iconType': iconType,
        'iconUrl': iconUrl,
        'url': url,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
