import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/model/album.dart';
import 'package:netease_cloud_music/model/banner.dart' as mBanner;
import 'package:netease_cloud_music/model/daily_songs.dart';
import 'package:netease_cloud_music/model/event.dart' as prefix0;
import 'package:netease_cloud_music/model/hot_search.dart';
import 'package:netease_cloud_music/model/lyric.dart';
import 'package:netease_cloud_music/model/mv.dart';
import 'package:netease_cloud_music/model/play_list.dart';
import 'package:netease_cloud_music/model/recommend.dart';
import 'package:netease_cloud_music/model/search_result.dart' hide User;
import 'package:netease_cloud_music/model/song_comment.dart' hide User;
import 'package:netease_cloud_music/model/song_detail.dart';
import 'package:netease_cloud_music/model/top_list.dart';
import 'package:netease_cloud_music/model/user.dart';
import 'package:netease_cloud_music/route/navigate_service.dart';
import 'package:netease_cloud_music/route/routes.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/loading.dart';
import 'package:path_provider/path_provider.dart';

import '../application.dart';
import 'custom_log_interceptor.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = 'http://127.0.0.1';

  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: '$baseUrl:3000', followRedirects: false))
      ..interceptors.add(CookieManager(cj))
      ..interceptors
          .add(CustomLogInterceptor(responseBody: true, requestBody: true));
  }

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static void _reLogin() {
    Future.delayed(Duration(milliseconds: 200), () {
      Application.getIt<NavigateService>().popAndPushNamed(Routes.login);
      Utils.showToast('登录失效，请重新登录');
    });
  }

  /// 登录
  static Future<User> login(
      BuildContext context, String phone, String password) async {
    var response = await _get(context, '/login/cellphone', params: {
      'phone': phone,
      'password': password,
    });

    return User.fromJson(response.data);
  }

  static Future<Response> refreshLogin(BuildContext context) async {
    return await _get(context, '/login/refresh', isShowLoading: false)
        .catchError((e) {
      Utils.showToast('网络错误！');
    });
  }

  /// 首页 Banner
  static Future<mBanner.Banner> getBannerData(BuildContext context) async {
    var response = await _get(context, '/banner', params: {'type': 1});
    return mBanner.Banner.fromJson(response.data);
  }

  /// 推荐歌单
  static Future<RecommendData> getRecommendData(BuildContext context) async {
    var response = await _get(context, '/recommend/resource');
    return RecommendData.fromJson(response.data);
  }

  /// 新碟上架
  static Future<AlbumData> getAlbumData(
    BuildContext context, {
    Map<String, dynamic> params = const {
      'offset': 1,
      'limit': 10,
    },
  }) async {
    var response = await _get(context, '/top/album', params: params);
    return AlbumData.fromJson(response.data);
  }

  /// MV 排行
  static Future<MVData> getTopMvData(
    BuildContext context, {
    Map<String, dynamic> params = const {
      'offset': 1,
      'limit': 10,
    },
  }) async {
    var response = await _get(context, '/top/mv', params: params);
    return MVData.fromJson(response.data);
  }

  /// 每日推荐歌曲
  static Future<DailySongsData> getDailySongsData(BuildContext context) async {
    var response = await _get(
      context,
      '/recommend/songs',
    );
    return DailySongsData.fromJson(response.data);
  }

  /// 歌单详情
  static Future<PlayListData> getPlayListData(
    BuildContext context, {
    Map<String, dynamic> params,
  }) async {
    var response = await _get(context, '/playlist/detail', params: params);
    return PlayListData.fromJson(response.data);
  }

  /// 歌曲详情
  static Future<SongDetailData> getSongsDetailData(
    BuildContext context, {
    Map<String, dynamic> params,
  }) async {
    var response = await _get(context, '/song/detail', params: params);
    return SongDetailData.fromJson(response.data);
  }

  /// ** 验证发现原来的歌单详情接口就有数据，不用请求两次！！ **
  /// 真正的歌单详情
  /// 因为歌单详情只能获取歌单信息，并不能获取到歌曲信息，所以要请求两个接口，先获取歌单详情，再获取歌曲详情
  static Future<SongDetailData> _getPlayListData(
    BuildContext context, {
    Map<String, dynamic> params,
  }) async {
    var r = await getPlayListData(context, params: params);
    var response = await getSongsDetailData(context, params: {
      'ids': r.playlist.trackIds.map((t) => t.id).toList().join(',')
    });
    response.playlist = r.playlist;
    return response;
  }

  /// 排行榜首页
  static Future<TopListData> getTopListData(BuildContext context) async {
    var response = await _get(context, '/toplist/detail');
    return TopListData.fromJson(response.data);
  }

  /// 获取评论列表
  static Future<SongCommentData> getSongCommentData(
    BuildContext context, {
    @required Map<String, dynamic> params,
  }) async {
    var response = await _get(context, '/comment/music',
        params: params, isShowLoading: false);
    return SongCommentData.fromJson(response.data);
  }

  /// 获取评论列表
  static Future<SongCommentData> getCommentData(
    BuildContext context,
    int type, {
    @required Map<String, dynamic> params,
  }) async {
    var funcName;
    switch (type) {
      case 0: // song
        funcName = 'music';
        break;
      case 1: // mv
        funcName = 'mv';
        break;
      case 2: // 歌单
        funcName = 'playlist';
        break;
      case 3: // 专辑
        funcName = 'album';
        break;
      case 4: // 电台
        funcName = 'dj';
        break;
      case 5: // 视频
        funcName = 'video';
        break;
      // 动态评论需要threadId，后续再做
    }
    var response = await _get(context, '/comment/$funcName',
        params: params, isShowLoading: false);
    return SongCommentData.fromJson(response.data);
  }

  /// 获取评论列表
  static Future<SongCommentData> sendComment(
    BuildContext context, {
    @required Map<String, dynamic> params,
  }) async {
    var response =
        await _get(context, '/comment', params: params, isShowLoading: true);
    return SongCommentData.fromJson(response.data);
  }

  /// 获取歌词
  static Future<LyricData> getLyricData(
    BuildContext context, {
    @required Map<String, dynamic> params,
  }) async {
    var response =
        await _get(context, '/lyric', params: params, isShowLoading: false);
    return LyricData.fromJson(response.data);
  }

  /// 获取个人歌单
  static Future<MyPlayListData> getSelfPlaylistData(
    BuildContext context, {
    @required Map<String, dynamic> params,
  }) async {
    var response = await _get(context, '/user/playlist',
        params: params, isShowLoading: false);
    return MyPlayListData.fromJson(response.data);
  }

  /// 创建歌单
  static Future<PlayListData> createPlaylist(
    BuildContext context, {
    @required Map<String, dynamic> params,
  }) async {
    var response = await _get(context, '/playlist/create',
        params: params, isShowLoading: true);
    return PlayListData.fromJson(response.data);
  }

  /// 创建歌单
  static Future<PlayListData> deletePlaylist(
    BuildContext context, {
    @required Map<String, dynamic> params,
  }) async {
    var response = await _get(context, '/playlist/delete',
        params: params, isShowLoading: true);
    return PlayListData.fromJson(response.data);
  }

  /// 获取热门搜索数据
  static Future<HotSearchData> getHotSearchData(BuildContext context) async {
    var response =
        await _get(context, '/search/hot/detail', isShowLoading: false);
    return HotSearchData.fromJson(response.data);
  }

  /// 综合搜索
  static Future<SearchMultipleData> searchMultiple(
      BuildContext context, {
        @required Map<String, dynamic> params,
      }) async {
    var response = await _get(context, '/search',
        params: params, isShowLoading: false);
    return SearchMultipleData.fromJson(response.data);
  }

  /// 获取动态数据
  static Future<prefix0.EventData> getEventData(
      BuildContext context, {
        @required Map<String, dynamic> params,
      }) async {
    var response = await _get(context, '/event',
        params: params, isShowLoading: false);
    return prefix0.EventData.fromJson(response.data);
  }

}
