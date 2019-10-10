import 'package:flutter/material.dart';
import 'package:netease_cloud_music/model/banner.dart' as prefix0;
import 'package:netease_cloud_music/utils/net_utils.dart';

class BannerModel with ChangeNotifier {
  prefix0.Banner _banner;

  get banner => _banner;

  Future<prefix0.Banner> getBannerData(BuildContext context) async {
    var r = await NetUtils.getBannerData(context);
    this._banner = r;
    notifyListeners();
    return r;
  }
}
