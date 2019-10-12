import 'package:flutter/material.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'discover/discover_page.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(150)),
                  child: TabBar(
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  right: ScreenUtil().setWidth(20),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: ScreenUtil().setWidth(50),
                      color: Colors.black87,
                    ),
                    onPressed: () {},
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
                  DiscoverPage(),
                  DiscoverPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
