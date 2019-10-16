import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/model/song.dart';
import 'package:netease_cloud_music/provider/play_songs_model.dart';
import 'package:provider/provider.dart';

class PlaySongsPage extends StatefulWidget {
  @override
  _PlaySongsPageState createState() => _PlaySongsPageState();
}

class _PlaySongsPageState extends State<PlaySongsPage> {

  PlaySongsModel _playSongsModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _playSongsModel = Provider.of<PlaySongsModel>(context);
      _playSongsModel.playSong(Song(188432));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PlaySongsPage'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_left, size: 50,), onPressed: (){}),
              IconButton(icon: Icon(Icons.pause, size: 50,), onPressed: (){
                _playSongsModel.pausePlay();
              }),
              IconButton(icon: Icon(Icons.arrow_left, size: 50,), onPressed: (){}),
            ],
          ),
        ));
  }

}
