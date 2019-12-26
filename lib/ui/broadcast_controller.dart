import 'package:flutter/material.dart';
import 'package:morse_code/domain/broadcast/broadcaster.dart';
import 'package:provider/provider.dart';

class BroadcastController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final broadcaster = Provider.of<Broadcaster>(context);

    return StreamBuilder<BroadcastState>(
        initialData: broadcaster.currentBroadcastState,
        stream: broadcaster.broadcastStateStream,
        builder: (context, snapshot) {
          final isPlaying = snapshot.data == BroadcastState.PLAYING;
          var children2 = <Widget>[
            isPlaying
                ? IconButton(
                    icon: Icon(
                      Icons.stop,
                      color: Colors.blue,
                    ),
                    onPressed: broadcaster.stop,
                  )
                : IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.blue,
                    ),
                    onPressed: broadcaster.play,
                  ),
            WordSpeedSlider(),
            IconButton(
              icon: Icon(
                Icons.lightbulb_outline,
                color: Colors.blue,
              ),
              onPressed: () {},
            )
          ];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children2,
          );
        });
  }
}

class WordSpeedSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final broadcaster = Provider.of<Broadcaster>(context);
    return StreamBuilder<double>(
        stream: broadcaster.wordSpeedStream,
        initialData: broadcaster.currentWordSpeed,
        builder: (context, snapshot) {
          final wordSpeed = snapshot.data;
          return Slider(
            divisions: 14,
            value: wordSpeed,
            min: 1,
            max: 15,
            label: wordSpeed.round().toString(),
            onChanged: broadcaster.setWordSpeed,
          );
        });
  }
}
