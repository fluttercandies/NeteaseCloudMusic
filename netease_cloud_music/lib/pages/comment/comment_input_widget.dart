import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'package:netease_cloud_music/widgets/common_text_style.dart';

typedef CommentCallback = void Function(String content);

class CommentInputWidget extends StatelessWidget {
  final TextEditingController _editingController = TextEditingController();

  final CommentCallback onTapComment;


  CommentInputWidget(this.onTapComment);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(100),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(1.5),
            color: Colors.black12,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20)),
                    color: Colors.white,
                    child: TextField(
                      controller: _editingController,
                      style: common14TextStyle,
                      textInputAction: TextInputAction.send,
                      onEditingComplete: sendComment,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "这一次也许就是你上热评了",
                        hintStyle: common14GrayTextStyle,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: sendComment,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    width: ScreenUtil().setWidth(100),
                    height: ScreenUtil().setWidth(100),
                    child: Text('发送'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendComment(){
    String text = _editingController.text;
    if(text.isEmpty){
      Utils.showToast( '评论内容不能为空！');
      return;
    }
    onTapComment(_editingController.text);
  }
}
