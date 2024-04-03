import 'package:flutter/material.dart';
import 'package:music_project/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      albumArtImagePath: "assets/image/miagi1.jpg",
      audioPath: "song/MiyaGi - Angel.mp3",
      songName: "Angel",
      artistName: "M I A G I",
    ),
    Song(
      albumArtImagePath: "assets/image/miagi2.jpg",
      audioPath: "song/MiyaGi - Angel.mp3",
      songName: "Samuray",
      artistName: "M I A G I",
    ),
    Song(
      albumArtImagePath: "assets/image/miagi3.jpg",
      audioPath: "song/MiyaGi - Angel.mp3",
      songName: "Panda",
      artistName: "M I A G I",
    ),
  ];
  int? _currentSongIndex ;

  List <Song> get playlist => _playlist;
  int? get currentSongIndex=> _currentSongIndex;



  set currentSongIndex (int? newindex) {
    _currentSongIndex = newindex;

    notifyListeners();
  }
}
