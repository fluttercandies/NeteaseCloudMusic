import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';

class LookImgPage extends StatefulWidget {
  final List<String> imgs;
  final int curIndex;

  LookImgPage(this.imgs, this.curIndex);

  @override
  _LookImgPageState createState() => _LookImgPageState();
}

class _LookImgPageState extends State<LookImgPage> {
  int curIndex;
  GlobalKey<ExtendedImageSlidePageState> slidePageKey =
      GlobalKey<ExtendedImageSlidePageState>();

  @override
  void initState() {
    super.initState();
    curIndex = widget.curIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: ExtendedImageSlidePage(
        key: slidePageKey,
        slideAxis: SlideAxis.both,
        slideType: SlideType.onlyImage,
        child: ExtendedImageGesturePageView.builder(
            itemBuilder: (context, index) {
              var item = widget.imgs[index];
              Widget image = ExtendedImage.network(
                item,
                enableSlideOutPage: true,
                mode: ExtendedImageMode.gesture,
                heroBuilderForSlidingPage: (r) {
                  return Hero(
                      tag: item + index.toString(),
                      child: r,
                      flightShuttleBuilder: (BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection flightDirection,
                          BuildContext fromHeroContext,
                          BuildContext toHeroContext) {
                        final Hero hero =
                            flightDirection == HeroFlightDirection.pop
                                ? fromHeroContext.widget
                                : toHeroContext.widget;
                        return hero.child;
                      });
                },
                initGestureConfigHandler: (state) {
                  return GestureConfig(
                      inPageView: true,
                      initialScale: 1.0,
                      //you can cache gesture state even though page view page change.
                      //remember call clearGestureDetailsCache() method at the right time.(for example,this page dispose)
                      cacheGesture: false);
                },
              );

              return GestureDetector(
                child: image,
                onTap: () {
//                  slidePageKey.currentState.popPage();
                  Navigator.pop(context);
                },
              );
            },
            itemCount: widget.imgs.length,
            controller: PageController(
              initialPage: curIndex,
            ),
            scrollDirection: Axis.horizontal),
      ), data: ThemeData(dialogBackgroundColor: Colors.black),
    );
  }
}

class a extends PopupRoute{
  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return null;
  }

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => null;

}

//class LookImgRoute extends PopupRoute {
//  final List<String> imgs;
//  final int index;
//  final List<BuildContext> clickImgs;
//
//  LookImgRoute(this.imgs, this.index, this.clickImgs);
//
//  @override
//  Color get barrierColor => Colors.black;
//
//  @override
//  bool get barrierDismissible => true;
//
//  @override
//  String get barrierLabel => null;
//
//  @override
//  Widget buildPage(BuildContext context, Animation<double> animation,
//      Animation<double> secondaryAnimation) {
//    return LookImgPage(imgs, index, clickImgs);
//  }
//
//  @override
//  Duration get transitionDuration => Duration(milliseconds: 300);
//}
//
//class LookImgPage extends StatefulWidget {
//  final List<String> imgs;
//  final int index;
//  final List<BuildContext> clickImgs;
//
//  LookImgPage(this.imgs, this.index,  this.clickImgs);
//
//  @override
//  _LookImgPageState createState() => _LookImgPageState();
//}
//
//class _LookImgPageState extends State<LookImgPage>
//    with TickerProviderStateMixin {
//  AnimationController controller;
//  Animation<Offset> animation;
//  bool isAnimEnd = false;
//  bool isPop = false;
//  Size size;
//  RenderBox render;
//  Offset offset;
//  int index;
//
//  @override
//  void initState() {
//    super.initState();
//    index = widget.index;
//    render = widget.clickImgs[index].findRenderObject();
//    size = render.size;
//    offset = render.localToGlobal(Offset.zero);
//    controller = AnimationController(
//      vsync: this,
//      duration: Duration(milliseconds: 300),
//    );
//    controller.addStatusListener((status) {
//      if (status == AnimationStatus.completed)
//        setState(() {
//          isAnimEnd = true;
//        });
//    });
//    animation = Tween(begin: offset, end: Offset(0, 0)).animate(controller);
//
//    WidgetsBinding.instance.addPostFrameCallback((c) {
//      setState(() {
//        size = Size(Application.screenWidth, Application.screenHeight);
//        controller.forward();
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        IndexedStack(
//          index: isAnimEnd ? 0 : 1,
//          children: <Widget>[
//            ExtendedImageGesturePageView.builder(
//              itemBuilder: (context, index) {
//                return GestureDetector(
//                  onTap: () {
//                    if (mounted)
//                      setState(() {
//                        isPop = true;
//                        isAnimEnd = false;
//                        size = render.size;
//                        try {
//                          RenderBox r =
//                          widget.clickImgs[index].findRenderObject();
//                          animation = Tween(
//                              end: r.localToGlobal(Offset.zero),
//                              begin: Offset(0, 0))
//                              .animate(controller);
//                        } catch (e){
//                          print(e);
//                        }
//                        controller.reset();
//                        controller.forward();
//                        Navigator.pop(context);
//                      });
//                  },
//                  child: Utils.showNetImage(widget.imgs[index]),
//                );
//              },
//              itemCount: widget.imgs.length,
//              scrollDirection: Axis.horizontal,
//              controller: PageController(initialPage: widget.index),
//              onPageChanged: (i) {
//                setState(() {
//                  index = i;
//                });
//              },
//            ),
//            ImagePositionedTransition(
//              rect: animation,
//              child: AnimatedContainer(
//                width: size.width,
//                height: size.height,
//                child: Utils.showNetImage(widget.imgs[index]),
//                duration: Duration(milliseconds: 300),
//              ),
//            )
//          ],
//        ),
//        Align(
//          child: Material(
//            color: Colors.transparent,
//            child: SafeArea(
//              child: Padding(
//                padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
//                child: Text(
//                  '${index + 1} / ${widget.imgs.length}',
//                  style: commonWhiteTextStyle,
//                ),
//              ),
//            ),
//          ),
//          alignment: Alignment.bottomCenter,
//        ),
//      ],
//    );
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//}
//
//class ImagePositionedTransition extends AnimatedWidget {
//  /// Creates a transition for [Positioned].
//  ///
//  /// The [rect] argument must not be null.
//  const ImagePositionedTransition({
//    Key key,
//    @required Animation<Offset> rect,
//    @required this.child,
//  })  : assert(rect != null),
//        super(key: key, listenable: rect);
//
//  /// The animation that controls the child's size and position.
//  Animation<Offset> get rect => listenable;
//
//  /// The widget below this widget in the tree.
//  ///
//  /// {@macro flutter.widgets.child}
//  final Widget child;
//
//  @override
//  Widget build(BuildContext context) {
//    return Positioned(
//      left: rect.value.dx,
//      top: rect.value.dy,
//      child: child,
//    );
//  }
//}
