import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:telkomsel_kuncie/components/bottomPlayerIcon.dart';
import 'package:telkomsel_kuncie/state/mediaPlayerState.dart';
import 'package:provider/provider.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer();

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  MediaPlayerState mpState;
  @override
  void didChangeDependencies() {
    mpState = context.watch<MediaPlayerState>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 10),
        color: Colors.grey[200],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomPlayerIcon(Icons.skip_previous, onTap: () {
                  mpState.previousSong();
                }),
                BottomPlayerIcon(
                    mpState.getSongState == AudioPlayerState.PLAYING? Icons.pause: Icons.play_arrow, 
                  onTap: () {
                  mpState.getSongState == AudioPlayerState.PLAYING? mpState.pauseSong(): mpState.playPausedSong();
                }),
                BottomPlayerIcon(Icons.skip_next, onTap: () {
                  mpState.nextSong();
                })
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:10),
              child: LinearProgressIndicator(
                value: mpState.getSongProgress,
                backgroundColor: Colors.grey[400],
              ),
            )
          ],
        ),
      ),
    );
  }
}
