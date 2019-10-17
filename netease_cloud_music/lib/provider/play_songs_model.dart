import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/model/song.dart';
import 'package:netease_cloud_music/model/user.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netease_cloud_music/utils/utils.dart';


class PlaySongsModel with ChangeNotifier {
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer get audioPlayer => _audioPlayer;
  List<Song> _songs = [];
  int curIndex = 0;



  List<Song> get allSongs => _songs;

  Song get curSong => _songs[curIndex];

  void init(){
    _audioPlayer.setReleaseMode(ReleaseMode.STOP);
    _audioPlayer.onPlayerStateChanged.listen((state){
      print(state);
    });
  }

  void playSong(Song song){
    _songs.insert(curIndex, song);
    play();
  }

  void playSongs(List<Song> songs, {int index}){
    this._songs = songs;
    if(index != null) curIndex = index;
    play();
  }

  void addSongs(List<Song> songs){
    this._songs.addAll(songs);
  }

  void play(){
    print("https://music.163.com/song/media/outer/url?id=${this._songs[curIndex].id}.mp3");
    _audioPlayer.play("https://music.163.com/song/media/outer/url?id=${this._songs[curIndex].id}.mp3");
  }

  void pausePlay(){
    if(_audioPlayer.state == AudioPlayerState.PAUSED) {
      resumePlay();
    }else {
      _audioPlayer.pause();
    }
  }

  void resumePlay(){
    _audioPlayer.resume();
  }
}
