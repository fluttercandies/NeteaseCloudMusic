import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/pages/splash_page.dart';
import 'package:netease_cloud_music/provider/user_model.dart';
import 'package:netease_cloud_music/route/navigate_service.dart';
import 'package:netease_cloud_music/route/routes.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:provider/provider.dart';

import 'application.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  Application.initSp();
  NetUtils.init();
  Application.setupLocator();


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserModel>.value(
        value: UserModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: Application.getIt<NavigateService>().key,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SplashPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
