import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/model/song.dart';
import 'package:netease_cloud_music/model/user.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netease_cloud_music/utils/utils.dart';

class PlaySongsModel{
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer get audioPlayer => _audioPlayer;
  StreamController<String> _curPositionController = StreamController<String>.broadcast();

  List<Song> _songs = [];
  int curIndex = 0;
  Duration curSongDuration;
  AudioPlayerState _curState;

  List<Song> get allSongs => _songs;
  Song get curSong => _songs[curIndex];
  get curPositionStream => _curPositionController.stream;
  AudioPlayerState get curState => _curState;


  void init() {
    _audioPlayer.setReleaseMode(ReleaseMode.STOP);
    _audioPlayer.onPlayerStateChanged.listen((state) {
      print('playState --- $state}');
      _curState = state;
    });
    _audioPlayer.onDurationChanged.listen((d) {
      curSongDuration = d;
    });
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      _curPositionController.sink.add('${p.inMilliseconds}-${curSongDuration.inMilliseconds}');
    });
  }

  void playSong(Song song) {
    _songs.insert(curIndex, song);
    play();
  }

  void playSongs(List<Song> songs, {int index}) {
    this._songs = songs;
    if (index != null) curIndex = index;
    play();
  }

  void addSongs(List<Song> songs) {
    this._songs.addAll(songs);
  }

  void play() {
    print(
        "https://music.163.com/song/media/outer/url?id=${this._songs[curIndex].id}.mp3");
    _audioPlayer.play(
        "https://music.163.com/song/media/outer/url?id=${this._songs[curIndex].id}.mp3");
  }

  void pausePlay() {
    if (_audioPlayer.state == AudioPlayerState.PAUSED) {
      resumePlay();
    } else {
      _audioPlayer.pause();
    }
  }

  void resumePlay() {
    _audioPlayer.resume();
  }

  dispose(){
    _curPositionController.close();
    _audioPlayer.dispose();
  }
}
