import 'package:flutter/material.dart';
import 'package:morse_code/domain/translator.dart';
import 'package:morse_code/ui/broadcast_buttons.dart';
import 'package:morse_code/ui/morse_view.dart';

class MorseScreen extends StatelessWidget {
  final String text;

  const MorseScreen({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translated"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                  child: MorseView(
            text: text,
          ))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: BroadcastButtons(
              symbols: translateText(text).symbols,
            ),
          )
        ],
      ),
    );
  }
}
