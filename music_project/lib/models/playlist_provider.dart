import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_project/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of song
  final List<Song> _playlist = [ 

    Song(
      albumArtImagePath: "assets/image/miagi1.jpg",
      audioPath: "song/MiyaGi.mp3",
      songName: "Angel",
      artistName: "M I A G I",
    ),
    Song(
      albumArtImagePath: "assets/image/miagi2.jpg",
      audioPath: "song/patron.mp3",
      songName: "Samuray",
      artistName: "M I A G I",
    ),
    Song(
      albumArtImagePath: "assets/image/miagi3.jpg",
      audioPath: "song/samuray.mp3",
      songName: "Patron",
      artistName: "P A N D A",
    ),
  ];

  //current song playing index
  int? _currentSongIndex ;

 /*

 A U D I O P L A Y E R

*/
 //audio player
 final AudioPlayer _audioPlayer = AudioPlayer();

 //durations
 Duration _currentDuration = Duration.zero;
 Duration _totalDuration = Duration.zero;

 //constructor
 PlaylistProvider(){
  listenToDuration();
  }

 //initiallity not playing

bool _isPlaying = false;
 //play the song 
void play () async {
  final String path =_playlist[_currentSongIndex!].audioPath;
  await _audioPlayer.stop(); // stop current song 
  await _audioPlayer.play(AssetSource(path)); //play the new song
  _isPlaying = true;
  notifyListeners();
}

 //pause current song
 void pause () async {
  await _audioPlayer.pause();
  _isPlaying = false;
  notifyListeners();
 }

 //resume playing
 void resume () async {
  await _audioPlayer.resume();
  _isPlaying = true;
  notifyListeners();
 }

 //pause or resume
 void pauseOrResume () async {
 if(_isPlaying) {
  pause();
 }else{
  resume();
 }
 notifyListeners();
 }

 //seek to a specitic position in the current song
 void seek(Duration position) async {
  await _audioPlayer.seek(position);
 }

 //play next song
 void playNextSong () {
  if(_currentSongIndex != null) {
    if(_currentSongIndex! < _playlist.length -1) {
      //go to th new song if it's not last song
      currentSongIndex = _currentSongIndex! +1;
    }else{
      //if it's the last song ,loop back to the th first song
      currentSongIndex = 0;
    }
  }
 }

 //play perevios song
 void playPreviousSong () async {
  //if more the 2 seconds have passed ,restart the current song
  if(_currentDuration.inSeconds > 2) {
    seek(Duration.zero);
  }
  //if it's within first 2 second of the song , go to previous song
  else {
    if(_currentSongIndex! > 0) {
  currentSongIndex = _currentSongIndex! -1;
    }else{
      //if it's the fist song , loop back to last song
      currentSongIndex = _playlist.length -1;
    }
  }
 }

 //listen to duration
 void listenToDuration () {

  //listen for total duration
  _audioPlayer.onDurationChanged.listen((newDuration) { 
    _totalDuration = newDuration;
    notifyListeners();
  });

  //listen for current duration
  _audioPlayer.onPositionChanged.listen((newPosition) { 
    _currentDuration = newPosition;
    notifyListeners();
  });

  //listenfor song completion
  _audioPlayer.onPlayerComplete.listen((event) {
    // playNextSong();
   });

 }

 //dispose aduio player

/*
  G E T T E R S

 */

  List <Song> get playlist => _playlist;
  int? get currentSongIndex=> _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /*

 S E T T E R S 


  */



  set currentSongIndex (int? newindex) {
    //UPDATE CURRENT SONG INDEX
    _currentSongIndex = newindex;

    if(newindex != null) {
      play(); //play the song at the new index
    }

   //UPDATE UI
    notifyListeners();
  }
}
