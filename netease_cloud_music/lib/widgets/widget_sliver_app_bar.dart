import 'package:flutter/material.dart';

typedef OnMySliverAppBarScroll = void Function(double shrinkOffset);

///Sliver App bar
class MySliverAppBar extends StatefulWidget {
  final Color backgroundColor;


  final double expandedHeight;
  final Widget action;
  final Widget leading;
  final Widget title;
  final Widget background;
  final bool hasBottomBorder;
  final bool fadeTitle;
  final bool fadeAppbarBackground;
  final OnMySliverAppBarScroll onScroll;
  MySliverAppBar(
      {this.backgroundColor,
      this.expandedHeight,
      this.action,
      this.leading,
      this.title,
      this.background,
      this.hasBottomBorder: false,
      this.fadeTitle: true,
      this.fadeAppbarBackground: true,
      this.onScroll});
  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;
    return SliverPersistentHeader(
      pinned: true,
      delegate: MySliverPersistentHeaderDelegate(
          background: widget.background,
          backgroundColor: widget.backgroundColor,
          expandedHeight: widget.expandedHeight,
          title: widget.title,
          action: widget.action,
          leading: widget.leading,
          topPadding: topPadding,
          hasBottomBorder: widget.hasBottomBorder,
          fadeTitle: widget.fadeTitle,
          fadeAppbarBackground: widget.fadeAppbarBackground,
          onScroll: widget.onScroll),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final double expandedHeight;
  final Widget action;
  final Widget leading;
  final Widget title;
  final Widget background;
  final double topPadding;
  final bool hasBottomBorder;
  final bool fadeTitle;
  final bool fadeAppbarBackground;
  final OnMySliverAppBarScroll onScroll;
  MySliverPersistentHeaderDelegate(
      {this.backgroundColor,
      this.expandedHeight,
      this.action,
      this.leading,
      this.title,
      this.background,
      this.topPadding,
      this.hasBottomBorder: false,
      this.fadeTitle: true,
      this.fadeAppbarBackground: true,
      this.onScroll});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final ThemeData themeData = Theme.of(context);
    var offset = -shrinkOffset;

    onScroll?.call(shrinkOffset);

    // TODO: implement build
    List<Widget> rowChild = new List<Widget>();
    rowChild.add(leading ?? Container());
    rowChild.add(action ?? Container());

    var color = backgroundColor ?? themeData.primaryColor;
    color = color.withOpacity(fadeAppbarBackground
        ? (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0)
        : 1.0);
    //color = color.withOpacity(shrinkOffset / expandedHeight);
//    emPrint((shrinkOffset + emKToolbarHeight + topPadding));
//    emPrint(shrinkOffset);
    //SliverAppBar(flexibleSpace: FlexibleSpaceBar(),)
    var child = Container(
      //height: expandedHeight,
      color: themeData.scaffoldBackgroundColor,
      child: Stack(
        //fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: offset,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: background ?? Container(),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.only(top: topPadding),
              alignment: Alignment.center,
              color: color,
              height: kToolbarHeight + topPadding,
              child: Opacity(
                opacity: fadeTitle
                    ? (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0)
                    : 1.0,
                child: title,
              ),
            ),
          ),
          Positioned(
            top: topPadding,
            left: 0.0,
            right: 0.0,
            child: Container(
                //color: color,
                height: kToolbarHeight,
                decoration: hasBottomBorder
                    ? BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1.0)),
                        //borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
                      )
                    : null,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: rowChild)),
          )
        ],
      ),
    );

    return Material(
        child: ClipRect(
      child: child,
    ));
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => kToolbarHeight + topPadding + expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => kToolbarHeight + topPadding;

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return expandedHeight != oldDelegate.expandedHeight ||
        action != oldDelegate.action ||
        leading != oldDelegate.leading ||
        title != oldDelegate.title ||
        backgroundColor != oldDelegate.backgroundColor ||
        background != oldDelegate.background ||
        topPadding != oldDelegate.topPadding;
  }
}

///App bar
class MyAppBar extends StatelessWidget {
  final Color backgroundColor;
  final Widget action;
  final Widget leading;
  final Widget title;
  MyAppBar({this.backgroundColor, this.action, this.leading, this.title});
  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;

    // TODO: implement build
    List<Widget> rowChild = new List<Widget>();
    rowChild.add(leading ?? Container());
    rowChild.add(action ?? Container());
    final ThemeData themeData = Theme.of(context);
    var color = backgroundColor ?? themeData.primaryColor;
    var child = Container(
      //height: expandedHeight,
      height: kToolbarHeight + topPadding,
      color: themeData.scaffoldBackgroundColor,
      child: Stack(
        //fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.only(top: topPadding),
              alignment: Alignment.center,
              color: color,
              height: kToolbarHeight + topPadding,
              child: title,
            ),
          ),
          Positioned(
            top: topPadding,
            left: 0.0,
            right: 0.0,
            child: Container(
                //color: color,
                height: kToolbarHeight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: rowChild)),
          )
        ],
      ),
    );

    return Material(
        child: ClipRect(
      child: child,
    ));
  }
}
