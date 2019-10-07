import 'package:flutter/material.dart';
import 'package:morse_code/domain/broadcast/broadcaster.dart';
import 'package:morse_code/domain/broadcast/signal.dart';
import 'package:morse_code/domain/symbols.dart';

class BroadcastButtons extends StatefulWidget {
  final List<MorseSymbol> symbols;

  const BroadcastButtons({Key key, this.symbols}) : super(key: key);

  @override
  _BroadcastButtonsState createState() => _BroadcastButtonsState();
}

class _BroadcastButtonsState extends State<BroadcastButtons> {
  double wordSpeed = 5;
  bool isPlaying = false;

  void setWordSpeed(double wordSpeed) {
    setState(() {
      this.wordSpeed = wordSpeed;
    });
  }

  void play() async {
    this.setState(() {
      print("set playing");
      isPlaying = true;
    });
    await Broadcaster(
            symbols: widget.symbols,
            wordSpeed: wordSpeed.round(),
            signal: LogSignal())
        .play();
    this.setState(() {
      print("stop playing");
      isPlaying = false;
    });
  }

  void stop() {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        isPlaying
            ? IconButton(
                icon: Icon(
                  Icons.stop,
                  color: Colors.blue,
                ),
                onPressed: stop,
              )
            : IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.blue,
                ),
                onPressed: play,
              ),
        Slider(
          divisions: 14,
          value: wordSpeed,
          min: 1,
          max: 15,
          label: wordSpeed.round().toString(),
          onChanged: setWordSpeed,
        ),
        IconButton(
          icon: Icon(
            Icons.lightbulb_outline,
            color: Colors.blue,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
