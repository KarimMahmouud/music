// ignore_for_file: camel_case_types

import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class playMusic extends StatefulWidget {
  const playMusic({super.key});

  @override
  State<playMusic> createState() => _playMusicState();
}

class _playMusicState extends State<playMusic> {
  var player = AudioPlayer();
  var cache = AudioCache();
  bool isPlaying = false;
  Duration currentPosation = const Duration();
  Duration musicLength = const Duration();

  @override
  void initState() {
    super.initState();
    setUp();
  }

  setUp() {
    player.onPositionChanged.listen((d) {
      setState(() {
        currentPosation = d;
      });
    });
    player.onDurationChanged.listen((d) {
      musicLength = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidgh = MediaQuery.of(context).size.width;

    playMusics() {
      player.play(AssetSource('play.mp3'));
    }

    stopMusic() {
      player.pause();
    }

    upTo(int sec) {
      player.seek(Duration(seconds: sec));
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/testimage.png'))),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: const Color.fromARGB(135, 204, 168, 168),
                  ))),
          Positioned(
              right: 0,
              left: 0,
              top: 0,
              bottom: 130,
              child: Image.asset(
                "assets/logo.png",
              )),
          Container(
            margin: EdgeInsets.only(top: screenHeight / 2.3),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.values[5],
                children: [
                  Text(
                    '0:${currentPosation.inSeconds}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    width: 250,
                    child: Slider.adaptive(
                      value: currentPosation.inSeconds.toDouble(),
                      max: musicLength.inSeconds.toDouble(),
                      onChanged: (val) {
                        upTo(val.toInt());
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  Text(
                    '0:${musicLength.inSeconds}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.black87,
                        border: Border.all(color: Colors.pink)),
                    child: IconButton(
                        onPressed: () {
                          if (currentPosation.inSeconds == 0 ||
                              currentPosation.inSeconds < 10) {
                            upTo(0);
                          } else if (currentPosation.inSeconds > 10) {
                            upTo(currentPosation.inSeconds - 10);
                          }
                        },
                        icon: const Icon(Icons.skip_previous,
                            size: 35, color: Colors.white)),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.black87,
                        border: Border.all(color: Colors.pink)),
                    child: IconButton(
                        onPressed: () {
                          if (isPlaying) {
                            setState(() {
                              isPlaying = false;
                            });
                            stopMusic();
                          } else {
                            setState(() {
                              isPlaying = true;
                            });
                            playMusics();
                          }
                        },
                        icon: !isPlaying ||
                                currentPosation.inSeconds ==
                                    musicLength.inSeconds
                            ? const Icon(Icons.play_arrow,
                                size: 35, color: Colors.white)
                            : const Icon(Icons.pause,
                                size: 35, color: Colors.white)),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.black87,
                        border: Border.all(color: Colors.pink)),
                    child: IconButton(
                        onPressed: () {
                          if (currentPosation <
                              musicLength - const Duration(seconds: 10)) {
                            upTo(currentPosation.inSeconds + 10);
                          } else {
                            upTo(musicLength.inSeconds);
                            setState(() {
                              isPlaying = false;
                            });
                            player.stop();
                          }
                        },
                        icon: const Icon(Icons.skip_next,
                            size: 35, color: Colors.white)),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
