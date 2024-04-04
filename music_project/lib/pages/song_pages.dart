import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_project/components/neu_box.dart';
import 'package:music_project/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});
//convert duration into min sec
String formatTime (Duration duration) {
  String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, "0");
  String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";
  return formattedTime;
}


  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get playlist
       final playlist = value.playlist;
        //get current song index
      final currentSong = playlist[value.currentSongIndex ?? 0];
        //return scaffold ui

        return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25,top: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //appBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    IconButton(
                      onPressed: () {Navigator.pop(context);},
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    //title
                    const Text(
                      "P L A Y L I S Y",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //menu button
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                      ),
                    ),
                  ],
                ),
               const Gap(30),
                //album artwork
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          currentSong.albumArtImagePath
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                   currentSong.songName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                 Text(currentSong.artistName),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 200,bottom: 20),
                              child: Icon(Icons.favorite,
                              color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              const   SizedBox(height: 30,),
                //song duration progress
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                    child: Column(
                      children:[ Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       //stars time 
                       Text(formatTime(value.currentDuration)),
                       //shuffle icon
                       const Icon(Icons.shuffle),
                       //repeat icon
                       const Icon(Icons.repeat),
                       //end time
                        Text(formatTime(value.totalDuration)),
                        ],
                      ),

                      SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                        thumbShape: 
                        const RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                       child: Slider(
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        activeColor: Colors.green,
                        onChanged: (double double) {
                           //duration when the user is sliding around
                          },
                          onChangeEnd: (double double) {
                          // sliding has finished , go to that poss=ition in song duration
                          value.seek(Duration(seconds: double.toInt()));
                          },
                         ),
                        ),
                      ],
                    ),
                  ),
                //playBack
                const Gap(10),
                  Row(
                    children: [
                      Expanded(child: 
                      GestureDetector(
                       onTap:value.playPreviousSong,
                       child: const NeuBox(
                        child: Icon(Icons.skip_previous),
                        ),
                       ),
                      ),
                     const Gap(20),
                      Expanded(
                        flex: 2,
                        child: 
                      GestureDetector(
                       onTap: value.pauseOrResume,
                       child:  NeuBox(
                        child: Icon(value.isPlaying ? Icons.pause:Icons.play_arrow),
                        ),
                       ),
                      ),
                     const Gap(20),
                      Expanded(child: 
                      GestureDetector(
                       onTap: value.playNextSong,
                       child: const NeuBox(
                        child: Icon(Icons.skip_next),
                        ),
                       ),
                      ),
                    ],
                 ),
              ],
            ),
          ),
        ),
      );
      }
    );
  }
}
