import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/model/comment_head.dart';
import 'package:netease_cloud_music/model/recommend.dart';
import 'package:netease_cloud_music/pages/comment/comment_page.dart';
import 'package:netease_cloud_music/pages/daily_songs/daily_songs_page.dart';
import 'package:netease_cloud_music/pages/home/home_page.dart';
import 'package:netease_cloud_music/pages/login_page.dart';
import 'package:netease_cloud_music/pages/look_img_page.dart';
import 'package:netease_cloud_music/pages/play_list/play_list_page.dart';
import 'package:netease_cloud_music/pages/play_songs/play_songs_page.dart';
import 'package:netease_cloud_music/pages/search/search_page.dart';
import 'package:netease_cloud_music/pages/splash_page.dart';
import 'package:netease_cloud_music/pages/top_list/top_list_page.dart';
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
      String data = params['data'].first;
      return PlayListPage(Recommend.fromJson(FluroConvertUtils.string2map(data)));
    });

// 跳转到每日推荐歌曲
var topListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return TopListPage();
    });


// 跳转到播放歌曲
var playSongsHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return PlaySongsPage();
    });

// 跳转到评论
var commentHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      String data = params['data'].first;
      return CommentPage(CommentHead.fromJson(FluroConvertUtils.string2map(data)));
    });

// 跳转到搜索页面
var searchHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return SearchPage();
    });

// 跳转到查看图片页面
var lookImgHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      List<String> imgs = FluroConvertUtils.fluroCnParamsDecode(params['imgs'].first).split(',');
      String index = params['index'].first;
      print(imgs);
      print(index);
      return LookImgPage(imgs, int.parse(index));
    });
