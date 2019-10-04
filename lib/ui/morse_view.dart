import 'package:flutter/material.dart';
import 'package:morse_code/domain/symbols.dart';
import 'package:morse_code/domain/translator.dart';
import 'package:morse_code/ui/broadcast.dart';

class MorseView extends StatelessWidget {
  final String text;

  const MorseView({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final symbols = translateSentence(text);
    return Column(
      children: <Widget>[
        Broadcast(symbols: symbols,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _displaySentence(symbols),
        ),
      ],
    );
  }

  List<Widget> _displaySentence(List<MorseSymbol> symbols) {
    List<List<MorseSymbol>> words = symbols.fold([[]], (wordList, symbol) {
      if(symbol == MorseSymbol.WORD_SPACE) {
        wordList.add([]);
      } else {
        wordList.last.add(symbol);
      }
      return wordList;
    });

    return words.map((List<MorseSymbol> word) => _displayWord(word)).toList();
  }

  Widget _displayWord(List<MorseSymbol> word) {
    List<List<MorseSymbol>> letters = word.fold([[]], (letterList, symbol) {
      if(symbol == MorseSymbol.LETTER_SPACE) {
        letterList.add([]);
      } else {
        letterList.last.add(symbol);
      }
      return letterList;
    });

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: 
        letters.map(_displayLetter).toList(),
      ),
    );
  }

  Widget _displayLetter(List<MorseSymbol> letter) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: letter.map(_displaySymbol).toList(),),
    );
  }



  Widget _displaySymbol(MorseSymbol letter) {
    switch (letter) {
      
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