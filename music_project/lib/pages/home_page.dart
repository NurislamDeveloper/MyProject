import 'package:flutter/material.dart';
import 'package:music_project/components/my_drawer.dart';
import 'package:music_project/models/playlist_provider.dart';
import 'package:music_project/models/song.dart';
import 'package:music_project/pages/song_pages.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // get playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    //get playlist provider
    playlistProvider =Provider.of<PlaylistProvider>(context,listen: false );
  }
  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;

    //navigate to song page
    Navigator.push(context, MaterialPageRoute(builder: (context) =>const  SongPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "P L A Y L I S T",
        ),
      ),
      drawer: const MyDrawer(),
      body: Consumer <PlaylistProvider> (
        builder: (context, value, child)  {
         final List <Song> playlist = value.playlist;
        
        return ListView.builder(
          itemCount:playlist.length ,
        itemBuilder:(context , index) {
             final Song song = playlist[index];

            return ListTile(
               title: Text(song.songName),
               subtitle: Text(song.artistName),
               leading: Image.asset(song.albumArtImagePath),
               onTap: () => goToSong(index),
            );
          },
         );
       },    
      ),
    );
  }
}
