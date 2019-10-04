import 'package:flutter/material.dart';
import 'package:morse_code/domain/broadcast/flash_broadcaster.dart';
import 'package:morse_code/domain/symbols.dart';

class Broadcast extends StatelessWidget {
  final List<MorseSymbol> symbols;

  const Broadcast({Key key, this.symbols}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text("Flash"),
          onPressed: () => FlashBroadcaster(symbols, 5).play(),)
      ],
    );
  }
}