import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/pages/daily_songs/daily_songs_page.dart';
import 'package:netease_cloud_music/pages/home/home_page.dart';
import 'package:netease_cloud_music/pages/login_page.dart';
import 'package:netease_cloud_music/pages/play_list/play_list_page.dart';
import 'package:netease_cloud_music/pages/splash_page.dart';
import 'package:netease_cloud_music/utils/fluro_convert_utils.dart';

// splash 页面
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return SplashPage();
    });

// 登录页
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return LoginPage();
    });

// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return HomePage();
    });

// 跳转到每日推荐歌曲
var dailySongsHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return DailySongsPage();
    });

// 跳转到歌单
var playListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      String title = params['title'].first;
      String id = params['id'].first;
      return PlayListPage(FluroConvertUtils.fluroCnParamsDecode(title), FluroConvertUtils.string2int(id));
    });
