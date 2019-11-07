import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/play_list.dart';
import 'package:netease_cloud_music/widgets/h_empty_view.dart';

import 'common_text_style.dart';

typedef SubmitCallback = Function(String name, String desc);

class EditPlayListWidget extends StatefulWidget {


  final SubmitCallback submitCallback;
  final Playlist playlist;

  EditPlayListWidget({@required this.submitCallback, @required this.playlist});

  @override
  _EditPlayListWidgetState createState() => _EditPlayListWidgetState();

}

class _EditPlayListWidgetState extends State<EditPlayListWidget> {
  bool isPrivatePlayList = false;
  TextEditingController _editingController;
  TextEditingController _descTextController;
  SubmitCallback submitCallback;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget.playlist.name);
    _descTextController = TextEditingController(text: widget.playlist.description ?? "");
    _editingController.addListener((){
      if(_editingController.text.isEmpty){
        setState(() {
          submitCallback = null;
        });
      }else{
        setState(() {
          if(submitCallback == null){
            submitCallback = widget.submitCallback;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '更改歌单信息',
        style: bold16TextStyle,
      ),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20)))),
      content: Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _editingController,
              decoration: InputDecoration(
                hintText: "请输入歌单标题",
                hintStyle: common14GrayTextStyle,
              ),
              style: common14TextStyle,
              maxLength: 40,
            ),
            TextField(
              controller: _descTextController,
              decoration: InputDecoration(
                hintText: "输入歌单描述",
                hintStyle: common14GrayTextStyle,
              ),
              style: common14TextStyle,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('取消'),
          textColor: Colors.red,
        ),
        FlatButton(
          onPressed: () {
            submitCallback(_editingController.text, _descTextController.text);
          },
          child: Text('提交'),
          textColor: Colors.red,
        ),
      ],
    );
  }
}
