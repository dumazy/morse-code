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

  void setWordSpeed(double wordSpeed) {
    setState(() {
      this.wordSpeed = wordSpeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.play_arrow,
            color: Colors.blue,
          ),
          onPressed: () => Broadcaster(
                  symbols: widget.symbols,
                  wordSpeed: wordSpeed.round(),
                  signal: LogSignal())
              .play(),
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
