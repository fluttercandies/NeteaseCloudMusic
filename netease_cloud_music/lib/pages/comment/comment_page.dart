import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netease_cloud_music/model/comment_head.dart';
import 'package:netease_cloud_music/model/song_comment.dart';
import 'package:netease_cloud_music/pages/comment/comment_type.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';
import 'package:netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:netease_cloud_music/widgets/v_empty_view.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:netease_cloud_music/widgets/widget_load_footer.dart';
import 'package:netease_cloud_music/widgets/widget_round_img.dart';

import 'comment_input_widget.dart';

class CommentPage extends StatefulWidget {
  final CommentHead commentHead;

  CommentPage(this.commentHead);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  Map<String, int> params;
  List<Comments> commentData = [];
  EasyRefreshController _controller;
  FocusNode _blankNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      params = {'id': widget.commentHead.id};
      _request();
    });
  }

  void _request() async {
    var r = await NetUtils.getCommentData(context, widget.commentHead.type, params: params);
    setState(() {
      if (r.hotComments != null && r.hotComments.isNotEmpty) {
        commentData.add(Comments(isTitle: true, title: "精彩评论"));
        commentData.addAll(r.hotComments);
      }
      if (commentData.where((d) => d.title == "最新评论").isEmpty) {
        commentData.add(Comments(isTitle: true, title: "最新评论"));
      }
      commentData.addAll(r.comments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text('评论(${widget.commentHead.count})'),
        ),
        body: Stack(
          children: <Widget>[
            Listener(
              onPointerDown: (d){
                FocusScope.of(context).requestFocus(_blankNode);
              },
              child: EasyRefresh(
                footer: LoadFooter(),
                controller: _controller,
                onLoad: () async {
                  params['offset'] == null
                      ? params['offset'] = 2
                      : params['offset']++;
                  _request();
                  _controller.finishLoad(
                      noMore: commentData.length >= widget.commentHead.count);
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      buildHead(),
                      Container(
                        height: ScreenUtil().setWidth(20),
                        color: Color(0xfff5f5f5),
                      ),
                      ListView.separated(
                          padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(30),
                              right: ScreenUtil().setWidth(30),
                              bottom: ScreenUtil().setWidth(50)),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildCommentItem(commentData[index]);
                          },
                          separatorBuilder: (context, index) {
                            if (commentData[index].isTitle)
                              return Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setWidth(30)),
                              );
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setWidth(30)),
                              height: ScreenUtil().setWidth(1.5),
                              color: Color(0xfff5f5f5),
                            );
                          },
                          itemCount: commentData.length),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              child: CommentInputWidget((content){
                // 提交评论
                NetUtils.sendComment(context, params: {
                  't': 1,
                  'type': widget.commentHead.type,
                  'id': widget.commentHead.id,
                  'content': content
                }).then((r){
                  Utils.showToast('评论成功！');
                  setState(() {
                    commentData.insert(commentData.map((c) => c.title).toList().indexOf('最新评论')+1, r.comment);
                  });
                });
              }),
              alignment: Alignment.bottomCenter,
            )
          ],
        ));
  }

  Widget buildCommentItem(Comments data) {
    if (data.isTitle)
      return Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(20)),
        child: Text(
          data.title,
          style: bold17TextStyle,
        ),
      );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RoundImgWidget(data.user.avatarUrl, 70),
        HEmptyView(10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    data.user.nickname,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil().setWidth(5)),
                    child: Text(
                      '${NumberUtils.amountConversion(data.likedCount)}',
                      style: common14GrayTextStyle,
                    ),
                  ),
                  HEmptyView(5),
                  Image.asset(
                    'images/icon_parise.png',
                    width: ScreenUtil().setWidth(35),
                    height: ScreenUtil().setWidth(35),
                  )
                ],
              ),
              VEmptyView(5),
              Text(
                DateUtil.getDateStrByMs(data.time,
                    format: DateFormat.YEAR_MONTH_DAY),
                style: smallGrayTextStyle,
              ),
              VEmptyView(20),
              Text(
                data.content,
                style:
                    TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildHead() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(30),
          vertical: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          RoundedNetImage(
            '${widget.commentHead.img}?param=200y200',
            width: 120,
            height: 120,
            radius: 4,
          ),
          HEmptyView(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.commentHead.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: commonTextStyle,
                ),
                VEmptyView(10),
                Text(
                  widget.commentHead.author,
                  style: common14TextStyle,
                )
              ],
            ),
          ),
          HEmptyView(20),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}
