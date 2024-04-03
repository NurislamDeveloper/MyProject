import 'package:flutter/material.dart';
import 'package:music_project/components/neu_box.dart';
import 'package:music_project/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
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
                        fontSize: 26,
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
                SizedBox(height: 30,),
                //album artwork
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          "assets/image/miagi1.jpg",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "So Sick",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text("Neyo"),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 210,bottom: 20),
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
                      children:[ const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       //stars time 
                       Text("0:00"),
                       //shuffle icon
                       Icon(Icons.shuffle),
                       //repeat icon
                       Icon(Icons.repeat),
                       //end time
                        Text("0:00"),
                        ],
                      ),

                      SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                        thumbShape: 
                        const RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                       child: Slider(
                        min: 0,
                        max: 100,
                        value: 50, 
                        activeColor: Colors.green,
                        onChanged: (value) {
                          },
                         ),
                        ),
                      ],
                    ),
                  ),
                //playBack
                 Row(
                  children: [
                   Expanded(
                     child: GestureDetector(
                      onTap: () {},
                       child: NeuBox(
                        child: Icon(Icons.skip_previous),
                       ),
                     ),
                   )
                  ],
                 ),
                   Row(
                  children: [
                   Expanded(
                     child: GestureDetector(
                      onTap: () {},
                       child: NeuBox(
                        child: Icon(Icons.play_arrow),
                       ),
                     ),
                   )
                  ],
                 ),
                    Row(
                  children: [
                   Expanded(
                     child: GestureDetector(
                      onTap: () {},
                       child: NeuBox(
                        child: Icon(Icons.play_arrow),
                       ),
                     ),
                   )
                  ],
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
