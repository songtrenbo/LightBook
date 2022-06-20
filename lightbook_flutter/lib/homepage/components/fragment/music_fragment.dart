
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MusicFragment extends StatefulWidget {
  @override
  State<MusicFragment> createState() => _MusicFragmentState();
}

class _MusicFragmentState extends State<MusicFragment> {
  final audioPlayer = AudioPlayer();

  bool isPlaying = false;

  Duration duration = Duration.zero;

  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    String url =
        'http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3';
    await audioPlayer.setUrl(url);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://gacsach.club/sites/default/files/styles/book310/public/tro_choi_tu_than.jpg?itok=QX9v-Ty5',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'Trò chơi tử thần',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'Ngọc Nữ Ngọc Nữ',
            style: TextStyle(fontSize: 17),
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);

              await audioPlayer.resume();
            },
            thumbColor: Colors.white,
            inactiveColor: Colors.grey,
            activeColor: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              iconSize: 50,
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.resume();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}
