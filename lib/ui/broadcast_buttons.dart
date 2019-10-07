import 'package:flutter/material.dart';
import 'package:morse_code/domain/broadcast/broadcaster.dart';
import 'package:morse_code/domain/broadcast/signal.dart';
import 'package:morse_code/domain/symbols.dart';

class BroadcastButtons extends StatelessWidget {
  final List<MorseSymbol> symbols;

  const BroadcastButtons({Key key, this.symbols}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text("Broadcast"),
          onPressed: () => Broadcaster(symbols: symbols, wordSpeed: 5, signal: LogSignal()).play(),)
      ],
    );
  }
}