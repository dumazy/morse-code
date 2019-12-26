import 'package:flutter/material.dart';
import 'package:morse_code/domain/broadcast/broadcaster.dart';
import 'package:morse_code/domain/symbols.dart';
import 'package:provider/provider.dart';

class MorseView extends StatefulWidget {
  final Sentence sentence;

  const MorseView({Key key, this.sentence}) : super(key: key);

  @override
  _MorseViewState createState() => _MorseViewState();
}

class _MorseViewState extends State<MorseView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _displaySentence(widget.sentence),
        ),
      ],
    );
  }

  List<Widget> _displaySentence(Sentence sentence) {
    return sentence.words.map((Word word) => _displayWord(word)).toList();
  }

  Widget _displayWord(Word word) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: word.letters.map(_displayLetter).toList(),
      ),
    );
  }

  Widget _displayLetter(Letter letter) {
    final broadcaster = Provider.of<Broadcaster>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Flexible(flex: 1, child: Text(letter.letter)),
        Flexible(
          flex: 3,
          child: StreamBuilder<MorseSymbol>(
              stream: broadcaster.broadcastedSymbolStream,
              builder: (context, snapshot) {
                final broadcastedSymbol = snapshot.data;
                return Row(
                  children: letter.symbols
                      .map(
                          (symbol) => _displaySymbol(symbol, broadcastedSymbol))
                      .toList(),
                );
              }),
        ),
      ]),
    );
  }

  Widget _displaySymbol(MorseSymbol symbol, MorseSymbol broadcastedSymbol) {
    final highlight = symbol == broadcastedSymbol;
    switch (symbol.type) {
      case MorseSymbolType.DOT:
        return DotSymbol(highlight: highlight);
      case MorseSymbolType.DASH:
        return DashSymbol(highlight: highlight);
      case MorseSymbolType.SYMBOL_SPACE:
        return SymbolSpace();
      case MorseSymbolType.LETTER_SPACE:
        return LetterSpace();
      default:
        return Container();
    }
  }
}

class DotSymbol extends StatelessWidget {
  final bool highlight;

  const DotSymbol({Key key, this.highlight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      width: highlight ? 12 : 10,
      height: highlight ? 12 : 10,
    );
  }
}

class DashSymbol extends StatelessWidget {
  final bool highlight;

  const DashSymbol({Key key, this.highlight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blue,
      ),
      width: highlight ? 27 : 25,
      height: highlight ? 12 : 10,
    );
  }
}

class SymbolSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      width: 10,
      height: 10,
    );
  }
}

class LetterSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.black12,
      ),
      width: 25,
      height: 10,
    );
  }
}
