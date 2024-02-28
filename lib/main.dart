import 'package:flutter/material.dart';

import 'play_music.dart';
// import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Music());
}

class Music extends StatelessWidget {
  const Music({super.key});

  // Expanded myButton(int index, String name) {
  //   final player = AudioPlayer();
  //   return Expanded(
  //     child: Padding(
  //       padding: const EdgeInsets.only(bottom: 2),
  //       child: ElevatedButton(
  //         style: const ButtonStyle(
  //           backgroundColor: MaterialStatePropertyAll(
  //             Color.fromARGB(255, 167, 164, 164),
  //           ),
  //         ),
  //         onPressed: () {
  //           player.play(AssetSource('assets_music-$index.mp3'));
  //         },
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 10.0),
  //           child: Row(
  //             children: [
  //               const Icon(
  //                 Icons.music_note,
  //                 color: Color.fromARGB(255, 159, 48, 48),
  //               ),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               Text(
  //                 name,
  //                 style: const TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 17,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: playMusic(),
      // home: Scaffold(
      //   backgroundColor: Colors.white,
      //   appBar: AppBar(
      //     backgroundColor: Colors.black38,
      //     title: const Text('Music'),
      //   ),
      //   body: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       myButton(1, 'My Music'),
      //       myButton(2, 'My Music'),
      //       myButton(3, 'My Music'),
      //       myButton(4, 'My Music'),
      //       myButton(5, 'My Music'),
      //       myButton(6, 'My Music'),
      //       myButton(7, 'My Music'),
      //     ],
      //   ),
      // ),
    );
  }
}
