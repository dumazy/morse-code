import 'package:flutter/material.dart';
import 'package:morse_code/domain/symbols.dart';

class MorseView extends StatelessWidget {
  final Sentence sentence;

  const MorseView({Key key, this.sentence}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _displaySentence(sentence),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Flexible(flex: 1, child: Text(letter.letter)),
        Flexible(
          flex: 3,
          child: Row(
              children: letter.symbols.map(_displaySymbol).toList(),
            ),
        ),
      ]),
    );
  }

  Widget _displaySymbol(MorseSymbol symbol) {
    switch (symbol) {
      case MorseSymbol.DOT:
        return DotSymbol();
      case MorseSymbol.DASH:
        return DashSymbol();
      case MorseSymbol.SYMBOL_SPACE:
        return SymbolSpace();
      case MorseSymbol.LETTER_SPACE:
        return LetterSpace();
      default:
        return Container();
    }
  }
}

class DotSymbol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      width: 10,
      height: 10,
    );
  }
}

class DashSymbol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blue,
      ),
      width: 25,
      height: 10,
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
