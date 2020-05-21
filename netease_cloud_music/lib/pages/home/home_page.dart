import 'package:flutter/material.dart';
import 'package:netease_cloud_music/provider/user_model.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/widget_play.dart';
import 'package:netease_cloud_music/widgets/widget_round_img.dart';
import 'package:provider/provider.dart';
import '../../application.dart';
import 'discover/discover_page.dart';
import 'event/event_page.dart';
import 'my/my_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置没有高度的 appbar，目的是为了设置状态栏的颜色
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
        ),
        preferredSize: Size.zero,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Padding(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        left: 20.w,
                        child: Consumer<UserModel>(
                          builder: (_, model, __) {
                            var user = model.user;
                            return GestureDetector(
                              onTap: () => NavigatorUtil.goUserDetailPage(context, user.account.id),
                              child:
                                  RoundImgWidget(user.profile.avatarUrl, 140.w),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(150)),
                        child: TabBar(
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          unselectedLabelStyle: TextStyle(fontSize: 14),
                          indicator: UnderlineTabIndicator(),
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: '发现',
                            ),
                            Tab(
                              text: '我的',
                            ),
                            Tab(
                              text: '动态',
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 50.w,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            NavigatorUtil.goSearchPage(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  VEmptyView(20),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        DiscoverPage(),
                        MyPage(),
                        EventPage(),
                      ],
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                  bottom:
                      ScreenUtil().setWidth(80) + Application.bottomBarHeight),
            ),
            PlayWidget(),
          ],
        ),
      ),
    );
  }
}
