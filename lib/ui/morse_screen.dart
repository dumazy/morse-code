import 'package:flutter/material.dart';
import 'package:morse_code/domain/broadcast/broadcaster.dart';
import 'package:morse_code/domain/broadcast/signal.dart';
import 'package:morse_code/domain/translator.dart';
import 'package:morse_code/ui/broadcast_controller.dart';
import 'package:morse_code/ui/morse_view.dart';
import 'package:provider/provider.dart';

import '../domain/broadcast/signal.dart';

class MorseScreen extends StatelessWidget {
  final String text;

  const MorseScreen({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sentence = MorseTranslator().translateText(text);
    return Scaffold(
      appBar: AppBar(
        title: Text("Translated"),
      ),
      body: Provider(
        create: (_) => Broadcaster(
          symbols: sentence.symbols,
          signal: FlashSignal(),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
                    child: MorseView(
              sentence: sentence,
            ))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: BroadcastController(),
            )
          ],
        ),
      ),
    );
  }
}
