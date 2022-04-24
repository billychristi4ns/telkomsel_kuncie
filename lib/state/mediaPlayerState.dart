import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:telkomsel_kuncie/models/song.dart';

class MediaPlayerState with ChangeNotifier {
  List<Song> _currentlyPlayingList=[];
  Song _currentlyPlayedSong;
  AudioPlayer _audioPlugin = AudioPlayer();
  Duration _positionSong=Duration(milliseconds: 0);
  AudioPlayerState _playerState=AudioPlayerState.STOPPED;
  Duration _fullDurationSong=Duration(seconds: 1000);

  List<Song> get getPlaylist=>_currentlyPlayingList;
  String get getCurrentSongId=>_currentlyPlayedSong?.trackId??'';
  AudioPlayerState get getSongState=>_playerState;
  double get getSongProgress=> _positionSong.inMilliseconds*1.0/_fullDurationSong.inMilliseconds*1.0;
  bool get isNoSong=>_currentlyPlayedSong==null;


  void setListenerPlayer(){
    _audioPlugin.onAudioPositionChanged.listen((p){ 
       _positionSong = p;
       notifyListeners();
       });

    _audioPlugin.onPlayerStateChanged.listen((s) {
      _playerState=s;
      if(_playerState==AudioPlayerState.COMPLETED)
      nextSong(); //play next song if completed
      notifyListeners();
    });
  }

  void playSong(Song data)async{
    _audioPlugin.stop();
    await _audioPlugin.play(data.songPreviewUrl);
    Future.delayed(Duration(milliseconds: 1000)).whenComplete(() =>  _fullDurationSong=_audioPlugin.duration);// even after await, there still delay 0.5 second to get full duration
    _currentlyPlayedSong=data;
    notifyListeners();
  }

  void pauseSong(){
    _audioPlugin.pause();
  }

  void playPausedSong(){
    // the plugin not supporting play paused song, so i create this manually
    if(_playerState==AudioPlayerState.PAUSED){
    _audioPlugin.play(_currentlyPlayedSong.songPreviewUrl);
    _audioPlugin.seek(_positionSong.inSeconds.toDouble());
    }
    else
    _audioPlugin.play(_currentlyPlayedSong.songPreviewUrl);
  }

  void setPlaylist(List<Song> data,Song start){
    _currentlyPlayingList=data;
    playSong(start);
  }

  void nextSong(){
    int indexCurrentPlayingSong= _currentlyPlayingList.indexWhere((e)=>e.trackId==_currentlyPlayedSong?.trackId??'');
    if(indexCurrentPlayingSong<_currentlyPlayingList.length-1) //check if last in playlist
    playSong(_currentlyPlayingList[indexCurrentPlayingSong+1]);
  }

  void previousSong(){
    int indexCurrentPlayingSong= _currentlyPlayingList.indexWhere((e)=>e.trackId==_currentlyPlayedSong?.trackId??'');
    if(indexCurrentPlayingSong>0) //check if first in playlist
    playSong(_currentlyPlayingList[indexCurrentPlayingSong-1]);
  }
  
}
